Return-Path: <SRS0=ZGgR=2U=oss.qualcomm.com=kishore.batta@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4383CC87FD2
	for <linux-firmware@archiver.kernel.org>; Fri,  8 Aug 2025 08:15:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EE1DEC4CEED; Fri,  8 Aug 2025 08:15:08 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DFC72C4CEF4
	for <linux-firmware@kernel.org>; Fri,  8 Aug 2025 08:15:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DFC72C4CEF4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5787he1G025030
	for <linux-firmware@kernel.org>; Fri, 8 Aug 2025 08:15:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9OpqygSjG0Yk7oyqDpWscp
	/UWb84BSusAOye/HQDgj8=; b=gB/9oEq44KXZgZu3VPQgUfs5xrXBiB2iQOOC+Q
	VxlitQ/80C8xevfRe9V3BjO/P+3Oa4fK5DxegT3Hv4lQP13Nnj0yZHHS7rFrx264
	2AAAlpA0tyDtzmmLlduysf+aDo2D9A7CRi7BARWmdKL1TPcz3QedF938wWHu4Fhl
	0exdHw83gLwEMCHhCPxVJV3zt03TfpeGnFObj7QCzgxnnVPI2pA7qogd0YMXjTJX
	H1WzJW+Ma5poJSGD0QZXS+0oO8KePmcFVaiBSMz5rEBCu3K4xVmAwlfCuGqX8CPM
	LZzw+dI9CpQyBAIs6lv+yHE25blkrknhk2EhutWKx0ICBLxA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw1h5dp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 08 Aug 2025 08:15:05 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-31effad1358so1760762a91.1
        for <linux-firmware@kernel.org>; Fri, 08 Aug 2025 01:15:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754640904; x=1755245704;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9OpqygSjG0Yk7oyqDpWscp/UWb84BSusAOye/HQDgj8=;
        b=FV9VNWM2wb466lYKyskFJJUG05NLcxMz69wzCBN2Trb1/n8mOgQS6/yjhQh86/+zGh
         NUtuhGSF9Dtb4I502vRXjxVhiWS/ogUNRc5yb1QBlfdpf+CLTAbGjQpxdlcxgA3GLBR+
         6b1xA+yIDb4B6YQW3EJK82E/s80asDpFMtTcU3TRYTad1wnYmtEP3Hcg9nlD5bFY96EU
         b8vyaiSIaAgFfyxks5Ehwy5ccilz3SmBSDHAGdxYuSLhakfs+zJJvbE+Emhn1SJyqIip
         Kufp6S5Zw3jf5si8lMS7Hp1eZ8MKfjBZVVNVxb+sOIpGPHshFq5mOVr3n7iAUJvj2FRu
         WFOA==
X-Gm-Message-State: AOJu0YxQ0ufGw6jiO0hAIM0lN33sSgfXoh9sChHCVdO4BM+9ukcejw5k
	306C66eeiRUGc2bUHhKY7Ggg3qBWLrV2GuvyXr4UDI9ZA+xv4t+9lHXKbbpWgxVSVJ+25DllfUT
	//D62F+5RtQzyv8sIFwbdtjj1Rn6YdR+f4pxMFxUMjx2Kigoj1QcG/fxgMdnsAlmxRkrTu2s=
X-Gm-Gg: ASbGncteVZvyEurJAVn8KJL/hUrCj4jz73hVvXmXsKNgjfIIKf4GfHjEesKdWkLbQYb
	vSqLUCrT2xd3PV9ai5wQEBCCUTU9iKSTHaAOU8NyEgtOPo9LyhbBn2TzxGiihljeaFCh9I0JL92
	o+rPfq0fWgOsd6C+3HS/6UelJO8bAvPcUHRsNoiOBWGCOfCUF/CYmb/uWaxiWE3sJdb1CG+VpNx
	vT/3LvTht1HX3nq6tYuYOrbICreyXu77BSTiQ/03J+ZsHsGDxH3uwfkcKJpSvueijep18yny7dg
	5B8dwsb6RjJUkGIhh0/JA+Ylo5Us7wb1c5Pua46QeJvt1V5dhmFq7B6V3GfGCBrnI6f2Uo9mSOC
	seQ==
X-Received: by 2002:a17:90b:2dcd:b0:31f:ecf:36f with SMTP id 98e67ed59e1d1-3217545bc16mr10518142a91.1.1754640904064;
        Fri, 08 Aug 2025 01:15:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJlHFX70MBqQkZGAdXxZyOzZvwbMHBSaxe0omYdAc460EpUeEyS29qUXowfNF75atGufR8vQ==
X-Received: by 2002:a17:90b:2dcd:b0:31f:ecf:36f with SMTP id 98e67ed59e1d1-3217545bc16mr10518091a91.1.1754640903564;
        Fri, 08 Aug 2025 01:15:03 -0700 (PDT)
Received: from [10.25.214.159] ([157.50.102.226])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32161259a48sm7398057a91.18.2025.08.08.01.15.00
        for <linux-firmware@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Aug 2025 01:15:03 -0700 (PDT)
Message-ID: <ee972bfa-38fc-45d7-b4f5-0dbb03b73fee@oss.qualcomm.com>
Date: Fri, 8 Aug 2025 13:44:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Subject: [PULL]: Add QDSP firmware file for Qualcomm QDU100 device.
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX6dnusLYlGZf5
 A5xE9I6jMh/rQLeycy5HEXJ/rg2DXbpwK/ZqZgt/3uwP6KU3J+J47qH3VMJrSx/K42fOoOJHxnj
 OinMDlJM3IYj5QiLVIKYvrkAX9bT2ccr8s7fk42yirHm29lNDXbxunwAJPCZJGJrh+0gm0u8HU3
 1wcSrSm4UMW/dTs/gfNQ8z5MTdqHMx+W65wzlqGmXdPrVdz2t7kCUfsaVEB/4OpOWiTF9EToEVZ
 FzrrLhxgi2FugL1k8LydDwjgzXUwLfS3b+tm5jVkYnJomrQonsaCLU4iISK5sF/LT+KTAV0yL3t
 5pog/WiJi1AqradQ2Rbeogoo64fpGWa63Y4jW/soh8qNf0QvUbR9rGlcDOCu6kn2oX2op6dVNOP
 LszXVDIT
X-Authority-Analysis: v=2.4 cv=Ha4UTjE8 c=1 sm=1 tr=0 ts=6895b209 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=4PD3CLIvPSJ82Sfhp4wA8g==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=NEAV23lmAAAA:8 a=JsS14Wddvee4Z92_b5UA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: WNJ5HIBwfBdQ5BOduYgTP6bHqAnaQ7LO
X-Proofpoint-GUID: WNJ5HIBwfBdQ5BOduYgTP6bHqAnaQ7LO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

The following changes since commit d30c7b425f6d9c9e9f54bcafa99b375342b3a774:

   Merge branch 'robot/pr-22-1754588181' into 'main' (2025-08-07 
17:52:32 +0000)

are available in the Git repository at:

   https://github.com/kishorebatta-ossqcom/linux-firmware.git qdsp_firmware

for you to fetch changes up to df21d427c17adf0ff372490e14841b970539d056:

   qcom: Add QDSP firmware file for Qualcomm QDU100 device. (2025-08-08 
13:27:29 +0530)

----------------------------------------------------------------
Kishore Batta (1):
       qcom: Add QDSP firmware file for Qualcomm QDU100 device.

  WHENCE                     |   1 +
  qcom/qdu100/qdsp6sw.mbn.xz | Bin 0 -> 5589248 bytes
  2 files changed, 1 insertion(+)
  create mode 100644 qcom/qdu100/qdsp6sw.mbn.xz

