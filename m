Return-Path: <SRS0=p7bb=CB=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45CE2CC6B03
	for <linux-firmware@archiver.kernel.org>; Thu,  2 Apr 2026 06:42:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 03BFCC2BC9E; Thu,  2 Apr 2026 06:42:50 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F0A0FC19423
	for <linux-firmware@kernel.org>; Thu,  2 Apr 2026 06:42:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F0A0FC19423
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631M4Skm1425465
	for <linux-firmware@kernel.org>; Thu, 2 Apr 2026 06:42:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1fgcVkQGLpQf+NLhTx8P4S
	hoLVMAFxoiKFNdquvgWA0=; b=nbWwCAW7La6R7gKAZopH1JOP1o0NiWZixfP4PG
	np/dFnojkbCZmrssKhCzH7S8/EoclYCBah5FP8MZHKXGlvuYgPBYXfuMs0EsX1no
	BiNqdayCDmyHpBzCS38lNA/ervW52xu4zMvGdYLZZ+bAODQDlxLserYbhekwHKQy
	VQDsRLRBOZhEHnHQhslQv9spB9gOk0lxwb3kLhjNBuL5oRfCRMqdydLUsMLGom5T
	mVOWa8SPyzaFBsQJPXeD/WEFaRxbLp6z9emQchzIhbcwvYfx7K/f1OJMsnircD1K
	AI5JPplFBAW8yb1SbPZyaLEpqb4iZ9YlhFf77+daHz9KTHWw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9511ba2r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 02 Apr 2026 06:42:47 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b250d3699aso13490455ad.2
        for <linux-firmware@kernel.org>; Wed, 01 Apr 2026 23:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775112166; x=1775716966; darn=kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1fgcVkQGLpQf+NLhTx8P4ShoLVMAFxoiKFNdquvgWA0=;
        b=fDpt+a06BsgXEtlae32KjJtjZlqS7MOrXACW/HSh34J8vdQQpfKfoI0MtC2HWve61A
         YF2J8TgslrENdWpjpfZXw0ZD3BM+CKGUTONgcjOq82NBgZWA1HvKbi6rmGebZcEwbpyD
         ZP12FHISZSEJz6iT+Nc4NjZcsBaw5gSZGTgsL2Q087CsOkjS3AYSwsQOx62oHoMVDIYT
         q5ZQnMr4IYqNrbdKfw92cwprIiiAc6wM1PxgFcb28bd3ERHxO9ujDqDHnNuiv6EjlbRa
         NDHyJDTEYN4HgL+4opvq6IsAv4+ggQJiJOLPvcXyEz2jt+wAhFSKZf7/iXL4Jhoz2XFL
         z4Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775112166; x=1775716966;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1fgcVkQGLpQf+NLhTx8P4ShoLVMAFxoiKFNdquvgWA0=;
        b=OCqjkJWzFogZp/q4gkzDdcSXh5uwUI38fTNuPxoJkTCENtU4uoE/noz8+KumEXkyER
         1Zp+41qtxCviXYhjFJLUz6rpk1BjbV1KLEbVviF7wjlwT5uUMgxOdXDTf+5oUaw5yYpV
         lU9m1SY/2zrF0ZWo9L1yeZCYIfjMwfklX01LU3ccYnpKkwgq6JhSRtLwCkpMvi4eg8hu
         c3FwZ/muzHcBVG2H6KAP4FG+ZZ1RIwGIBEkCGT6U7M4CSNzHU7p6SFmqBuKFbwC0Nzrv
         yZm7MwK7D8DCQGPPHRr0iwrKcaA6x2E08PVLOeNUb92Rjs/VVQlRFFPV6rCMh3XAfzyb
         9S0g==
X-Gm-Message-State: AOJu0YyPHzrYwT5bZKaupZe/P5qSKtktCM6JjSW0UVz7slGACj+Y9Igv
	BXtZ+Z887bktb+3CwK626CRKmRjr50+AjoJ14MlMDvqKD6uWicT28DKeof9Xnz5SToACa64RySf
	oy7O8zu/APved5dazJpPe4pgTziaZpyl0FL9j6xaKplp2XVjNOWs7yrXRT6h150qYhxkkFgY=
X-Gm-Gg: AeBDietMEsELREpLbCe5wa5SMUvAEraidBP2YYDubjEpQlh6ZbcoIS1r4EY8AwIQKb+
	90enLKQdQiU2+hU1yb4IRRsyN1C7r+srWKlDRnTmCKowtw29/kg2SOudaQ7jVBWV1LYFPs4L/RW
	3P7gT1WxQlwL2E+Nl7UFqMtZFZWneM6jqwF0dKR0tQs8AEDO31oy31ZMf9Eg4+giPbePOeuNhIH
	SbvVsL7QcknMEZPY7hmGTz3J1tPZR7+EzWJvq1/cY7tLF+PpT3p6lL/hS+kMmtnKmRFRrFLN2E9
	jq2mlZtSt0A20nxjL9VABXla2LWynA81Urq0vr1tYpp0BmNJHcrhqfdvHjU3i1fq7N4pf8UVMuN
	rhERFMAP3I5LMnvi/cQWroK3NZ6pQcCxzjr1VPoA3GcY/aeChYQ==
X-Received: by 2002:a17:903:248:b0:2b0:af2f:b26a with SMTP id d9443c01a7336-2b269ce75dfmr62461495ad.48.1775112166479;
        Wed, 01 Apr 2026 23:42:46 -0700 (PDT)
X-Received: by 2002:a17:903:248:b0:2b0:af2f:b26a with SMTP id d9443c01a7336-2b269ce75dfmr62461325ad.48.1775112165986;
        Wed, 01 Apr 2026 23:42:45 -0700 (PDT)
Received: from [10.204.86.92] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27478945asm23708875ad.28.2026.04.01.23.42.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 23:42:45 -0700 (PDT)
Message-ID: <4b6c7b4f-dab4-4271-a7b5-8449b2ada199@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 12:12:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Subject: qcom: update CDSP firmware for glymur platform
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA1NyBTYWx0ZWRfX6ysIOfwmHRiF
 TpsIGZCBacWYQzerK73c8PKlnnguamrebAo828ml8I0VlSrk5JHsL7X5zsbvbq/qYT1xTzu7aG2
 wkjxNTC4a5zS6OzHCkpN1Ml0Z/js1+WpH4PIrpEEAjG+c493sQJTynkynoFGe/mDvzYWFovKLgK
 9t2/bjq+o95sGT0ZuDtSq2TAsvot46MkzDIdlzHMN0p4/kS/s99nYJgLxpgdIg2zyiau/S39vcp
 0XouHFsRh7lG6CJV3HFEaZjQT0S4k/5+U5Dg/D3Fi19RrubkHC1mhY8WcIz2BSconRW/duZXvqu
 zrpXcrN4Q/dROYo8J86EDYWscasyI//GBBxsH+i+wQHDXO6uirzTLNfKuI27krlo+fwknveIOnI
 t/3sCvDZXSzUS4wrTzjy/qXK6eB4oyMBa/qdk43kOUrEXvZmRVDJKKXZe4T2NCg3DnG62EuIKj2
 4/lzLvnqYqVue8APijA==
X-Proofpoint-GUID: KyHCH05KjMdJBgrotwbKy1BQz5KRQvwM
X-Proofpoint-ORIG-GUID: KyHCH05KjMdJBgrotwbKy1BQz5KRQvwM
X-Authority-Analysis: v=2.4 cv=F8pat6hN c=1 sm=1 tr=0 ts=69ce0fe7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=qC_FGOx9AAAA:8 a=XVsfLpG8jI4Vz9lwU4gA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020057

The following changes since commit 441bcf2eaa2a2dd6edbab83181a66a2db537c470:

   Merge branch 'robot/pr-0-1774880321' into 'main' (2026-03-31 13:21:46 
+0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
cdspfw-glymur

for you to fetch changes up to 7590efdfb65f29bceeb0cd3da6157eafb121ff6b:

   qcom: update CDSP firmware for glymur platform (2026-04-02 12:08:15 
+0530)

----------------------------------------------------------------
Venkata Kota (1):
       qcom: update CDSP firmware for glymur platform

  WHENCE                   |   2 +-
  qcom/glymur/cdsp.mbn     | Bin 3252504 -> 3252504 bytes
  qcom/glymur/cdsp_dtb.mbn | Bin 69432 -> 69432 bytes
  3 files changed, 1 insertion(+), 1 deletion(-)
