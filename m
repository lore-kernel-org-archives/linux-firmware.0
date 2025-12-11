Return-Path: <SRS0=rhHs=6R=oss.qualcomm.com=rajesh.kemisetti@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7427D41D65
	for <linux-firmware@archiver.kernel.org>; Thu, 11 Dec 2025 15:57:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 97CB5C4CEFB; Thu, 11 Dec 2025 15:57:39 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8420DC4CEF7
	for <linux-firmware@kernel.org>; Thu, 11 Dec 2025 15:57:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8420DC4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BBEPPxP2384912
	for <linux-firmware@kernel.org>; Thu, 11 Dec 2025 15:57:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sU/YWPpj6gB8LYjdc8pbct
	rIY7Xf4TpBlGWbQMY6GAk=; b=SAUKfzqhPEV1OcFulDfk3jWuHs/dqh0bBLj7iR
	i58C9JSrLisIQyb8B0RTdiCXIaAOnyONaoyuD8vCln70E77N+eIPc6J4G4QLcyWG
	RRf2GS+dRdxK0nfnIE5VdJ/TIoyIwrGp7/9n9RHONKbJJqYwJNGIqbhhYgmoWkcp
	dmA/II8i8+gqTNzVYOEC7p7hK3v5uO5g0ZlTmItC28uoQQIHWbXSc0NyQnjCDF9s
	Q66AhFn36EOuTagPx2vE5cVGnVdYROJtgCe9KTJ0pBzPWwjP0FknmQ+ihXtBc4fX
	rLk3RgJLNbZhJdJoEztkYXqAsk0jsbWfUhkzObPCLGwaGZWA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ayvrygvkq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 11 Dec 2025 15:57:37 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-295592eb5dbso4351615ad.0
        for <linux-firmware@kernel.org>; Thu, 11 Dec 2025 07:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765468656; x=1766073456; darn=kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sU/YWPpj6gB8LYjdc8pbctrIY7Xf4TpBlGWbQMY6GAk=;
        b=Pj/2v17ggK+I5f0yns2HlPbsWgIob8usfStjBUzB8v39AZi5hvk35R76Wtq22lBnqs
         uedja+EkDMCZDlWtdrck2tKeuar+rxRRhcpwX7WqOR2OP9xAzpGbXzzabHryX2w6e2vM
         fc7qcwEoI+tQhOSiSoV4axcfJrk1s86CUOOvsujvw0/GGnTlIVTc5zrseX1KwUmk4e4A
         +DgRH8HGk1nExeT2+kRbB7fiMlJH9WhHWYhc4hyT9a1VIC8WDLH2zJoTrEI5mG4TR8af
         zh5wdUXubCssAc3Pm284NVyUVYpoAh9Ak5dOkAJcwwCkxh/IeVM40z4Sz7o48qXIMj55
         n16A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765468656; x=1766073456;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sU/YWPpj6gB8LYjdc8pbctrIY7Xf4TpBlGWbQMY6GAk=;
        b=l7/PFrmANVHIC4U16BVNTVy3jvkbdpURDZkfF0xB8YhD1IwpfFEpKC9xWcdyQ69BWT
         p8f/qzS8pdJBma9OFyLbCoDoeGnwElO7v3eIRu275r1GnY4x86dMwMYfMkit2B6kJdQM
         6Fe7EfTkEW7kxilLXBfPUkPg5e1LDPYd0j4WtlIfSGsQaQY3JeXSiV0+EEe91DqgtZE5
         vKfjbWz6w+Vq1nyUuRs1vqX/b8SkXHz4qkv/RMp2p4hIfyOvqJUEd2SLi6Gc78IV95OV
         LLecFmAskdawZKNW7G54ORh5q5nGrrUB6jbjUmaa9ZzQBxiWSrKkYnZig73H+HziuXcD
         gCbA==
X-Gm-Message-State: AOJu0Yzz+pOElB66LDimTv0aUsnTk7Fzyq2St/VNmiKpIQDWgS3Kx/ME
	Yv5kS/Eoih6hY51zTMJPx1+2FgIeeDw2Sh5L2hbYi4XnjUMgbuKeiRnjymYwSM5FFx0zfYQ6SzA
	8zwB3VHSc84g8jDgBUGL056E0S4qqBuJvcHxwsGOavB2I+bGUQjp5Vj/t22EqHZTseMQ+eOE=
X-Gm-Gg: AY/fxX7DsGrUugVVqtHr2DSfIOP72yAAoatRpd5ZWsevItyuNMksvF8iwwDXpPhUb+m
	1wodO93U6FxsLnj5IOJrC/jnc27A4iEsTZsjS3Tid8UzNHMv775EBi7fIdWf/6M7+ClQXCwp7PA
	8ShDPKLkgnb0lzFGhp/cN+4l48CjU+vVobIvvA1r1wpT3KzQSxBu1p+BznOSS4gQyXO2bLpRL4g
	upP1mHifsNTFVRw2WdBTbL7qxBOnXMUYUcMFyja+kY5ah0pH4pCKhH9EbTXy/jsunvFIiIicnT6
	+A+ssmVdSYSAogPhYAwllFjl5zCuOk9PzD5YaZE90GddqoAqlnBCEc//l/fGQOkVAIraWgtd62E
	kZn5pmIeNr+WRTO1BG2hvRJZGPVOhruqqXEDEFSM6skCP
X-Received: by 2002:a17:902:ccc9:b0:29e:3823:a70 with SMTP id d9443c01a7336-29ec27bae62mr68907055ad.42.1765468656003;
        Thu, 11 Dec 2025 07:57:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGpZw++CER5wtSXvj7mBZVa9T32af1V5QfkG6NJfHTLdSs+Y58M0vomUaQbKJzTnJ4EEJEC4Q==
X-Received: by 2002:a17:902:ccc9:b0:29e:3823:a70 with SMTP id d9443c01a7336-29ec27bae62mr68906645ad.42.1765468655476;
        Thu, 11 Dec 2025 07:57:35 -0800 (PST)
Received: from [10.206.98.239] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29efd4941b8sm12540145ad.9.2025.12.11.07.57.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Dec 2025 07:57:35 -0800 (PST)
Message-ID: <5aea673e-c0f4-4f0d-af76-97bee75c2111@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 21:27:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>
From: Rajesh Kemisetti <rajesh.kemisetti@oss.qualcomm.com>
Subject: [GIT PULL] qcom: GPU firmwares for sm8150/sm8450/sm8550/sm8650/sm8750
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=P9g3RyAu c=1 sm=1 tr=0 ts=693ae9f1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=-SmVa_pks6GDd0OOrwkA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: yAhygoNUqjgrL4avnphrTI0DzVAatPtY
X-Proofpoint-ORIG-GUID: yAhygoNUqjgrL4avnphrTI0DzVAatPtY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDEyNyBTYWx0ZWRfXwlq3SnfN+p0l
 IJ6zWAQGkr8wfraipgENxAj7m2Wc/NxvSNzDYhidxoPtjVIOHapp19Ry+9wbbeZlmcNlw/4xDaC
 1VGnTiqBm6ixXSQg4bMV8rQX7Hp+DALfxE0RycB123NGn1kjlFxwoVA4dlGWGc6QjJuQppkfTI+
 MDncpF9pcQsvScTVDPvxr1GxX9IY3sUXrgLT+HyIKiHHHaKRUwC3y2l3rqTqGzBvIMeXMAjQQBF
 CMAlyt8JOWMlJytZ0E4c/L0+3xumlQyYOGGKng4ZGLSeqcIjmVaWX2zaeHde0vPq7SnZ8cBceCF
 b11qcpPNYaXuaqW+eU9tSsz6wDUMlFlsZXdiArZpCZF5tad4QmrkGCmxxJajjUzqGcD8pYbrfzu
 ShzlxJS8n+cSZkGEun8WGjYGiPsQsw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-11_01,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 suspectscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110127

Hi,

Please pull the gpu firmwares required for Qualcomm's sm8150/sm8450/sm8550/sm8650/sm8750 chipsets.

-Rajesh

---
The following changes since commit 0dffef69496d3c521ce5f883bdc16c0aca9360b5:

   Merge branch 'make-licence' into 'main' (2025-12-08 20:28:51 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git gpu-fw-dec-11

for you to fetch changes up to d718d63001004a0802d99ae88cb0bb5bad6f29a9:

   qcom: Add firmwares for sm8150 GPU (2025-12-11 21:13:18 +0530)

----------------------------------------------------------------
Rajesh Kemisetti (5):
       qcom: Add firmwares for sm8750 GPU
       qcom: Add firmwares for sm8650 GPU
       qcom: Add firmwares for sm8550 GPU
       qcom: Add firmwares for sm8450 GPU
       qcom: Add firmwares for sm8150 GPU

  WHENCE                       |  33 +++++++++++++++++++++++++++++++++
  qcom/a640_gmu.bin            | Bin 0 -> 37680 bytes
  qcom/a730_sqe.fw             | Bin 0 -> 75924 bytes
  qcom/a740_sqe.fw             | Bin 0 -> 76724 bytes
  qcom/gen70900_aqe.fw         | Bin 0 -> 33176 bytes
  qcom/gen70900_sqe.fw         | Bin 0 -> 85364 bytes
  qcom/gen80000_aqe.fw         | Bin 0 -> 25044 bytes
  qcom/gen80000_gmu.bin        | Bin 0 -> 88896 bytes
  qcom/gen80000_sqe.fw         | Bin 0 -> 111476 bytes
  qcom/gmu_gen70000.bin        | Bin 0 -> 57272 bytes
  qcom/gmu_gen70200.bin        | Bin 0 -> 66844 bytes
  qcom/gmu_gen70900.bin        | Bin 0 -> 78588 bytes
  qcom/sm8150/a640_zap.mbn     | Bin 0 -> 14256 bytes
  qcom/sm8450/a730_zap.mbn     | Bin 0 -> 12088 bytes
  qcom/sm8550/a740_zap.mbn     | Bin 0 -> 12088 bytes
  qcom/sm8650/gen70900_zap.mbn | Bin 0 -> 12088 bytes
  qcom/sm8750/gen80000_zap.mbn | Bin 0 -> 12088 bytes
  17 files changed, 33 insertions(+)
  create mode 100644 qcom/a640_gmu.bin
  create mode 100644 qcom/a730_sqe.fw
  create mode 100644 qcom/a740_sqe.fw
  create mode 100644 qcom/gen70900_aqe.fw
  create mode 100644 qcom/gen70900_sqe.fw
  create mode 100644 qcom/gen80000_aqe.fw
  create mode 100644 qcom/gen80000_gmu.bin
  create mode 100644 qcom/gen80000_sqe.fw
  create mode 100644 qcom/gmu_gen70000.bin
  create mode 100644 qcom/gmu_gen70200.bin
  create mode 100644 qcom/gmu_gen70900.bin
  create mode 100644 qcom/sm8150/a640_zap.mbn
  create mode 100644 qcom/sm8450/a730_zap.mbn
  create mode 100644 qcom/sm8550/a740_zap.mbn
  create mode 100644 qcom/sm8650/gen70900_zap.mbn
  create mode 100644 qcom/sm8750/gen80000_zap.mbn


