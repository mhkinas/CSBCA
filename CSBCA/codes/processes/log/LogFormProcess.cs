
using System;
using System.Diagnostics;
using CSBCA.codes.parameters;
using Microsoft.AspNetCore.Http;
using SDBCS.utility;

namespace CSBCA.codes.processes
{
    public class LogFormProcess : BaseProcess
    {
        public new LogFormParams p = null;
        public void initProcess(IHttpContextAccessor httpContextA, LogFormParams p)
        {
            this.p = p;
            base.initProcess(httpContextA, p);
            isDebug = p.isDebug;
        }
    }
}