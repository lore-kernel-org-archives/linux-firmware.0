Return-Path: <SRS0=P3Y1=AI=oss.qualcomm.com=saddam.patan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74512E6E815
	for <linux-firmware@archiver.kernel.org>; Wed,  4 Feb 2026 05:54:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4543DC116C6; Wed,  4 Feb 2026 05:54:58 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 775AAC4CEF7
	for <linux-firmware@kernel.org>; Wed,  4 Feb 2026 05:54:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 775AAC4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6144cxmr4122713
	for <linux-firmware@kernel.org>; Wed, 4 Feb 2026 05:54:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hQeMUzqWgGB9wFWYrkBgJe
	3akHaBWkw0IMDyUJNT95o=; b=fGodTQvgiQYrzusdEyJPkzqIHZiW9h2Lph7m1E
	595EYAMvjyKiDvfnse82/GLHTD71B6/AEELHW8t3kgLA1lFe/hFwuRk65mPHd8A5
	OSVZfiMEpOV8Sa0OsAloHhsPO6bxs0UQCy0PLjPFLKU6ON4+Oi/WwYLWz/CyjThV
	CTkqbCwyEu8VNtwb4DJjkJY52oy8cEncpfY22qlfcmAMeEvp8FxUjOwXEvV6RZqF
	jk5t2nOhs3k9S1TPGH3u2iP2Zs0r7oJ7pC61Hm6nbdoc65tHwRccipjN7T9T9+c+
	7gAXGpi7YJDZGWdkeqh7aHJPMNqDwYzKC6GaMNI3/5Jo/m+g==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3kbkjpvb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 04 Feb 2026 05:54:56 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-124a978ba9bso7848922c88.0
        for <linux-firmware@kernel.org>; Tue, 03 Feb 2026 21:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770184496; x=1770789296; darn=kernel.org;
        h=content-transfer-encoding:subject:cc:to:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQeMUzqWgGB9wFWYrkBgJe3akHaBWkw0IMDyUJNT95o=;
        b=RrxDPCahCvWijADjyvX7z30NIueEORR22Iash5hHBv97iRq2PYnO/rP6j0aubR/2PI
         lyvOhXz7CAqjKdoWhXAUPMWcK4aCCtDRYnUbJDM/QlFFPLX3w/vlaoQfLSPL7416g1EQ
         b1FnQ6buMc6JvSL1pMYWc+ishQur+XIaSTJbW5GZorFqoMoqAIqQkYcYARYXaU4MQoAY
         Y0my7Ev7b5D4kjJYO4BAB7mvKsFyHK7R5iEfIypcBHvcoZ8Bmjt0ncQi94O73wCro+xm
         xPX2tj7xyuKNeOPklxeWb0IAkXvZlqWFxfuMqpUKN44rgxRTyli9fqV7GsEaVWircz4N
         Q+fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770184496; x=1770789296;
        h=content-transfer-encoding:subject:cc:to:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hQeMUzqWgGB9wFWYrkBgJe3akHaBWkw0IMDyUJNT95o=;
        b=laBaoxc2vDiAeBrrRM98sNyDCW5Sxt93/KD4qUwWthoa7t/5U5jji9NU2ixbmrVeQj
         TNrxLvX3mc9lckVf7nROT2rkYl0HwmGGsvCyfMnyVOe4pm9Tf+/8Xc8zEe6cRAHNtXGI
         0B3H/D5ZeUjFrIruJKmNzCQ23xeHFTGYtIedZO/CFj1LL91bmFvDNFGKDMnN+CDgbrU1
         Ym6dmucMAfd7gYY4z4kVBg7n76FNHQhGOs62HGYeAJ7urGpXNSP303fNrBrh6GFpjzsQ
         CibmGNrgQ/KFoq244F2dEFKl5mnaR2hOAgwirqPZcng+ANl29ny6IA/YhUbFaaQE1sK6
         fQvA==
X-Gm-Message-State: AOJu0Yy095itcCrEngI2VNGtqotz/rjNBS1PcRN4OmSlvG5c2tq4fzmQ
	GlhKUYE/YTAplm29YZCwm7ZK8mradxKTQuEVN8FkeQe8TJSByGHmZljBtfANjcStfMKZeRGRoK5
	JshtaQ6ePDhfBCYNGsnuB4gnDwmWprXrCJxBM47RKZzF1GnSOVe3AP1TlDRxWMdtVTaueoUo=
X-Gm-Gg: AZuq6aJCZ87922Zvy23hndQ2Jre9ea7MC81yzQ+MRdX0RiMATv+ZSfxdCpEYfGPk8o7
	xkR3i9UT/u2oChJjxG9KmGizS0jiRlrJi7pzOqdKQvjIeuXd1UrkaZWh9AYXS/r+FZYyiFpYV5Y
	LPcVQK8K7hEtHs1vaEpm4nMUcNlaYyrESS6JGLQvrk3saANLSiAX41o4tmT46MjWXRr0OS8RrFV
	Y9hYqHU1rSBjys47pVyKWXxRtUSK2MC0x6+Fa35gH5/WLbGrZPyT5dqfvlkNm0XN3mOc5HC1GGr
	C4oBQEMoYO+650ACrvp1tSkdZNxBeaQ3MaxZM2sVRLUBcJGAzrrqBwbbT44xM+cVwGqOl/vgOUh
	OBZWwz8RlD0fGC+aPthZUKSQkZy3z9tJP0oYqVXiw
X-Received: by 2002:a05:7022:a86:b0:11b:9386:8271 with SMTP id a92af1059eb24-126f48e2e29mr910648c88.46.1770184495591;
        Tue, 03 Feb 2026 21:54:55 -0800 (PST)
X-Received: by 2002:a05:7022:a86:b0:11b:9386:8271 with SMTP id a92af1059eb24-126f48e2e29mr910637c88.46.1770184495004;
        Tue, 03 Feb 2026 21:54:55 -0800 (PST)
Received: from [10.206.100.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-126f503d0fbsm1255402c88.13.2026.02.03.21.54.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 21:54:54 -0800 (PST)
Message-ID: <f67a3934-a0ce-4dec-8694-d5a2146e7e58@oss.qualcomm.com>
Date: Wed, 4 Feb 2026 11:24:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Saddam Patan <saddam.patan@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: venkata.kota@oss.qualcomm.com, kssb@qti.qualcomm.com
Subject: qcom: add ADSP, CDSP firmware for glymur platform
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: pajCrLLWBe9LRPJ5HxgBWFkSZMDsxXuC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDA0MSBTYWx0ZWRfXzq5PLCTwjzcd
 6NYGGM5aiZKYdKd1GKDhoHhy8EgaKe2RwY4oMfR8CfIxl5W3guYdhefV2yUN7fzCSJdHacyUNy8
 lJfs1n2lsAF6VFwfQEIOqSGD6UIHVzEuPjJzrUC3NTWgCBpZfhxSm/YUNjbXKARzufgW/6sYE+5
 M3eE/CkBVLeeG31tdajEqhm9ArAOBDkArFUFOiQ20hobwkPuXa7iKLDUJx4yXI6Eobx07nAqxw4
 1h7Bi1uihbr3h1lakiVNRvTvn/KK4qGYwPtCpVV4OYizxvKXH3Kku1GOlaEzC3KuUG8FSkrHGs4
 qZmpckbbwbTaWA/1/3IVfFBGEuChZ24ipXm66HFFXqREcChFofyFvpGK9hEC38fz4XR9PrGEK+j
 bhsyHQRfKvh4OWJD+5jItfR9BPUZCPiE07F/CpJGy0phf92i7YZDYhQveAlIFYfPCPGRXEsR5Te
 8hZXm3N4kLRdnNueKzw==
X-Authority-Analysis: v=2.4 cv=BKy+bVQG c=1 sm=1 tr=0 ts=6982df30 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=-ND0dA32Beo5UO0_gUEA:9
 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: pajCrLLWBe9LRPJ5HxgBWFkSZMDsxXuC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0 spamscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602040041

The following changes since commit ce97e4b1cb874c67a132441f9d69a55511a1ded5:

   Merge branch 'robot/patch-0-1770091836' into 'main' (2026-02-03 
04:34:00 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dsp-fw-glymurdsp

for you to fetch changes up to b69afa29d3f60c1939a745879441acd43a2f0c73:

   qcom: add ADSP, CDSP firmware for glymur platform (2026-02-04 
10:10:46 +0530)

----------------------------------------------------------------
Saddam Patan (1):
       qcom: add ADSP, CDSP firmware for glymur platform

  WHENCE                   |  10 ++++++++++
  qcom/glymur/adsp.mbn     | Bin 0 -> 18622472 bytes
  qcom/glymur/adsp_dtb.mbn | Bin 0 -> 7253 bytes
  qcom/glymur/adspr.jsn    |  22 ++++++++++++++++++++++
  qcom/glymur/adsps.jsn    |  22 ++++++++++++++++++++++
  qcom/glymur/adspua.jsn   |  29 +++++++++++++++++++++++++++++
  qcom/glymur/cdsp.mbn     | Bin 0 -> 3252504 bytes
  qcom/glymur/cdsp_dtb.mbn | Bin 0 -> 69432 bytes
  qcom/glymur/cdspr.jsn    |  22 ++++++++++++++++++++++
  9 files changed, 105 insertions(+)
  create mode 100644 qcom/glymur/adsp.mbn
  create mode 100644 qcom/glymur/adsp_dtb.mbn
  create mode 100644 qcom/glymur/adspr.jsn
  create mode 100644 qcom/glymur/adsps.jsn
  create mode 100644 qcom/glymur/adspua.jsn
  create mode 100644 qcom/glymur/cdsp.mbn
  create mode 100644 qcom/glymur/cdsp_dtb.mbn
  create mode 100644 qcom/glymur/cdspr.jsn
