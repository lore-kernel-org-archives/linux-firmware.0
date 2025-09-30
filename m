Return-Path: <SRS0=PEt3=4J=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4638CCA470
	for <linux-firmware@archiver.kernel.org>; Tue, 30 Sep 2025 19:22:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8EFBFC4CEF7; Tue, 30 Sep 2025 19:22:18 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C0746C4CEF0
	for <linux-firmware@kernel.org>; Tue, 30 Sep 2025 19:22:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C0746C4CEF0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UBRiSS012703
	for <linux-firmware@kernel.org>; Tue, 30 Sep 2025 19:22:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6K6IDixBaJHXgh4oNpKbWI
	9wSNlO1+qeL8vlJXSAItY=; b=XeNAx7mFhZ2p9fcBNbztV5DJV9Kp95Gtt45sZb
	LwZsiefVe0e0y4p0b4ND+VBGq3eaqMh54y0JosbJvQg6CQgW+2QwQ7bB/nQONI3N
	Xcd2ueG+k2igCXPCVTJo8pP9OCsSr0fmA0JrUlB9E9LrvMe+3epc/DJ4MMnejWRI
	ZisIe1nJM4sLX0aOvnLDC9+DPrv30p71si2kr5tROnB4immfg0z/nBiVq7/FKDYN
	Txmk6DQ4keSGAVBbuwZPBv8WAM37dcBLry+KXKmd426Hly8mPAZx+n2BgW+HJAsm
	yufnhdoE3Lyj8UJx7PdX7uVhQIVOlsy37KcWbdwyFgYhNfRw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e5mctjw7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 30 Sep 2025 19:22:16 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b471737e673so7768019a12.1
        for <linux-firmware@kernel.org>; Tue, 30 Sep 2025 12:22:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759260136; x=1759864936;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6K6IDixBaJHXgh4oNpKbWI9wSNlO1+qeL8vlJXSAItY=;
        b=kyAwH460ZMHIOZrcqDAFzoJKbkqJ1EyF8rYm8cOONjyVQaShQZnKKv0TJVRuGxHONV
         IgRkfPYUSwIT710wLItP9yXGSiZMvNIS8Tvxk4oUgeMCDW1bG1NLcEUR4U+UdFPkvoCT
         tXA8G10Mzd/Mtn/fowI/mA9diuIxQljltRRitGyo9dj8FuoV4R2C4wc1dXUkvjkkAQOF
         y2RwSFSHss7lOcKXYUUXz3OKkjikSQC1z2RhzKOGU0IkFdoi6gjiIW7RVAjxWzqqvg9z
         OBlaQkD88FCakN+l34H7W8iJScNwhrJ4vhHmwNbxIKWu4Xp6NUORNwrmTqg+6tN7TzE+
         behw==
X-Gm-Message-State: AOJu0Yxigm3jGiwO1fAEZCxfEon5cYTAKMAgojlIWVFR1/AoUJ7Qhi1L
	MGKVZXu/pW7o/i54V/CcU+gTTyR3tOs2k6L0jjeOv5iJT+gkNzsyaw1l1diff5Byf9eDDZ2TXF8
	owrc8j6EKgZNg8pl8D8f8N9vMsAxGXMNEVERPr0TeN8oUBThc6ACNQnyoEbVNif+napj5QRAnUA
	==
X-Gm-Gg: ASbGncuZ3AM8jQ5r0UsUdj8VkbTmdT6nT8gq3o0yNeop4DuOGEbz74NETdzTCZpQOTD
	/a7UBjFIUyB4f6cEnAN9cmseY5tJWoND5+jH93X/OY6zJlIw4M6Vc+Jo7VeoCp/15dq3wH2TBwc
	mj6AP9r0fbwgKAS4m77peZxIf0WdUWNAvdjfRJ7lFema4CS3caYdaXITOB73irr0i5IltWb6UKO
	bNMPPtxijHAzprluPEdANg9z3f0Q4akNuKxn5/x+g0qNdyjImMgCc/Pwqbsjd7jKdwLLEOVuSkh
	SlWHuXb7VaBnuwC2CGDZX5O9fTq07Bi2GrtyxqPY22Yzhd+2FiJSLG/cHuEc5RkXWIsdZ+WcmUb
	jAQ==
X-Received: by 2002:a05:6a20:9143:b0:246:7032:2c1d with SMTP id adf61e73a8af0-321d1e6274bmr1284432637.23.1759260135735;
        Tue, 30 Sep 2025 12:22:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMtag5o0xs486IWLVigWdIVxNUvJcH5YmS05O/aFT+FnGmYV9UFY/dq/PCW8crNnnJEMnEpA==
X-Received: by 2002:a05:6a20:9143:b0:246:7032:2c1d with SMTP id adf61e73a8af0-321d1e6274bmr1284400637.23.1759260135293;
        Tue, 30 Sep 2025 12:22:15 -0700 (PDT)
Received: from [192.168.0.202] ([49.204.103.130])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c557418csm14301688a12.30.2025.09.30.12.22.14
        for <linux-firmware@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Sep 2025 12:22:14 -0700 (PDT)
Message-ID: <631ae62f-2849-4a2f-888e-52afd40dfd0f@oss.qualcomm.com>
Date: Wed, 1 Oct 2025 00:52:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Subject: qcom: Update DSP firmware for qcs8300 platform
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RMC+3oi+ c=1 sm=1 tr=0 ts=68dc2de8 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ESLlCZJ65S52b8JmbLwmNw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=qC_FGOx9AAAA:8 a=XR6v-_ntFxsetChiJYAA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: 8_AlvuKhdukg7ekZu2G6aaBbtHatL3iC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwNCBTYWx0ZWRfX+DQKsQ4umRZl
 RVFOZOtuSF7ZnKg+rQJeCssSXP6KkbMPnRVgxZUXAhUvG0dYYOaHec681YQGhbkbXzTVt2ZoAAq
 2R7lD3cLoO5eK5sC5yXCDzJ8jqO05SPrzh9tl2/beaa68E7ixkPZqM4wXsQ5SU1hsiTdLMnvZpg
 Rg4jWAVGDx0LbdM9mItfgUdeU6fM/SwMRFB8nsYmoT+EPa+Oy30pPWRfr0/6B1JL51rvOjthPqL
 bLE5M8FZHMdEyywiipw8QgnWeEh1VcPfdSWVeWVx1eYMXZQ48oUEe2sPLZYm4VPUj8tQSj+fz4u
 +CcNawineUHYqWoGWb7wmciZpM85zvd/9Ryb4XFb0fO2uxOjvgxKhMT2znYNQ4Zn3gv41zx2KbM
 mxHk2gHOvRW98kk9doVnGC1DMddSkA==
X-Proofpoint-GUID: 8_AlvuKhdukg7ekZu2G6aaBbtHatL3iC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270004

The following changes since commit 2725800a9b5c532fcd1bc6c1502cb4678463416d:

   Merge branch 'main' into 'main' (2025-09-29 11:56:44 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dsp-fw-qcs8300-dspmon-163

for you to fetch changes up to e19ad53acfa6627509065463333296cb9bf05f25:

   qcom: Update DSP firmware for qcs8300 platform (2025-10-01 00:50:17 
+0530)

----------------------------------------------------------------
Venkata Kota (1):
       qcom: Update DSP firmware for qcs8300 platform

  WHENCE                  |   6 +++---
  qcom/qcs8300/adsp.mbn   | Bin 6684672 -> 6692864 bytes
  qcom/qcs8300/cdsp0.mbn  | Bin 3080192 -> 3096576 bytes
  qcom/qcs8300/gpdsp0.mbn | Bin 5873664 -> 5881856 bytes
  4 files changed, 3 insertions(+), 3 deletions(-)
