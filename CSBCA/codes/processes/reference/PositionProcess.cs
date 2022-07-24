using CSBCA.codes.parameters;
using Microsoft.AspNetCore.Http;

namespace CSBCA.codes.processes
{
    public class PositionProcess : BaseProcess
    {
        public new PositionParams p = null;
        public void initProcess(IHttpContextAccessor httpContextA, PositionParams p)
        {
            this.p = p;
            base.initProcess(httpContextA, p);
            isDebug = p.isDebug;
        }
    }
}