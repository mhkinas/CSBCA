using System;
using System.Diagnostics;
using CSBCA.codes.parameters;
using Microsoft.AspNetCore.Http;
using SDBCS.utility;


namespace CSBCA.codes.processes
{
    public class CodeTypeProcess : BaseProcess
    {
        public new CodeTypeParams p = null;
        public void initProcess(IHttpContextAccessor httpContextA, CodeTypeParams p)
        {
            this.p = p;
            base.initProcess(httpContextA, p);
            isDebug = p.isDebug;
        }
    }
}
