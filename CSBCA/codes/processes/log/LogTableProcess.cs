
using CSBCA.codes.parameters;
using Microsoft.AspNetCore.Http;

namespace CSBCA.codes.processes
{
    public class LogTableProcess : BaseProcess
    {
        public new LogTableParams p = null;
        public void initProcess(IHttpContextAccessor httpContextA, LogTableParams p)
        {
            this.p = p;
            base.initProcess(httpContextA, p);
            isDebug = p.isDebug;
        }
    }
}