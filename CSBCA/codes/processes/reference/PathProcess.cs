using CSBCA.codes.parameters;
using Microsoft.AspNetCore.Http;
using SDBCS.utility;
using System;
using System.Diagnostics;

namespace CSBCA.codes.processes
{
    public class PathProcess : BaseProcess
    {
        public new PathParams p = null;
        public void initProcess(IHttpContextAccessor httpContextA, PathParams p)
        {
            this.p = p;
            base.initProcess(httpContextA, p);
            isDebug = p.isDebug;
        }
    }
}