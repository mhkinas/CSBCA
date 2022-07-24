
using CSBCA.codes.parameters;
using Microsoft.AspNetCore.Http;

namespace CSBCA.codes.processes
{
    public class LogTypeProcess : BaseProcess
    {
        public new LogTypeParams p = null;
        public void initProcess(IHttpContextAccessor httpContextA, LogTypeParams p)
        {
            this.p = p;
            base.initProcess(httpContextA, p);
            isDebug = p.isDebug;
        }
    }
}

