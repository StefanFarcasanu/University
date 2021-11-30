// g++ -std=c++11 -Wall -g -o pb1.exe pb1.cpp

#include<cstdio>
#include<queue>
#include<cstring>
#include<vector>
#include<iostream>
#include<fstream>
using namespace std;
int c[1001][1001];
int flowPassed[1001][1001];
vector<int> g[1001];
int parList[1001];
int currentPathC[1001];
int bfs(int sNode, int eNode)
{
    memset(parList, -1, sizeof(parList));
    memset(currentPathC, 0, sizeof(currentPathC));
    queue<int> q;
    q.push(sNode);
    parList[sNode] = -1;
    currentPathC[sNode] = 999;
    while (!q.empty())
    {
        int currNode = q.front();
        q.pop();
        for (int i = 0; i < g[currNode].size(); i++)
        {
            int to = g[currNode][i];
            if (parList[to] == -1)
            {
                if (c[currNode][to] - flowPassed[currNode][to] > 0)
                {
                    parList[to] = currNode;
                    currentPathC[to] = min(currentPathC[currNode],
                                           c[currNode][to] - flowPassed[currNode][to]);
                    if (to == eNode)
                    {
                        return currentPathC[eNode];
                    }
                    q.push(to);
                }
            }
        }
    }
    return 0;
}
int edmondsKarp(int sNode, int eNode)
{
    int maxFlow = 0;
    while (true)
    {
        int flow = bfs(sNode, eNode);
        if (flow == 0)
        {
            break;
        }
        maxFlow += flow;
        int currNode = eNode;
        while (currNode != sNode)
        {
            int prevNode = parList[currNode];
            flowPassed[prevNode][currNode] += flow;
            flowPassed[currNode][prevNode] -= flow;
            currNode = prevNode;
        }
    }
    return maxFlow;
}
int main(int argc, char** argv)
{
    int nodCount, edCount;
    ifstream f(argv[1]);
    ofstream out(argv[2]);

    f >> nodCount >> edCount;
    int source, sink;

    for (int ed = 0; ed < edCount; ed++)
    {
        int from, to, cap;
        f >> from >> to >> cap;
        c[from][to] = cap;
        g[from].push_back(to);
        g[to].push_back(from);
    }
    source = 0;
    sink = nodCount - 1;
    int maxFlow = edmondsKarp(source, sink);
    out << maxFlow << endl;

    f.close();
    out.close();
    return 0;
}