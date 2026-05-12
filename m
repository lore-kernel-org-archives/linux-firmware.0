Return-Path: <SRS0=EMOb=DJ=oss.qualcomm.com=saddam.patan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B32CD4F24
	for <linux-firmware@archiver.kernel.org>; Tue, 12 May 2026 14:00:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 70978C2BCB0; Tue, 12 May 2026 14:00:50 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 45A8CC2BCF6
	for <linux-firmware@kernel.org>; Tue, 12 May 2026 14:00:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 45A8CC2BCF6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CCA3Z4144553
	for <linux-firmware@kernel.org>; Tue, 12 May 2026 14:00:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=D9Gt6XZhQqmiYcCtoUmQ9r
	m1DUW56q7c1mBeDrSE5vo=; b=iP+1OK5FFNZ/uGuirAWZAIRsWh+w04T+wIdv00
	43+vamHhD+fAi9rDPtMVOUq5sk+I9OR+lL2G7fmE6kE5KsT+bPnubaPPA0DUJ4Vz
	DEOgV8BoXgV0yQ6YoranzoXna4p4gkBdd026jeNhydnqfBvAQJDDN4C8vIwI2s2P
	J5XNfGz0TGlpAx0b14ErxhOPzXVohMg6LLX/+OekEMf9/n96hea4CEUmXI2Okx2H
	9CwzAMH6Fco/EEOZOaTQXBOpUHAuNT//H7sXGMA0HnPDUN+Rf5fBX6K63u+a+pNl
	ClOSpcDgGpwM7ryxHh0y9Zpfo2+knIiRpxhiVJWBPVpZRdTA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e43yp8bxk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 12 May 2026 14:00:35 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2efc342ef15so7619122eec.1
        for <linux-firmware@kernel.org>; Tue, 12 May 2026 07:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778594435; x=1779199235; darn=kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D9Gt6XZhQqmiYcCtoUmQ9rm1DUW56q7c1mBeDrSE5vo=;
        b=XexaTHrs5NXIMKq/QwcyJkCRaMStNwMH377z58B0e3/OYZ67+6Ijg1sRvacCxsa5s9
         rDUeos0Rbro7B6J4rySoHh9S6q3D2j/A3G8mW6lN5VCDp9ffwbUUtB6n9+k55Lm2yg36
         h/lrw0hXfjr3iDMm+DSNgJkelovfP2QBscCDekEwoU89rod/C08SBtk5O43tJCIWLPFe
         EjCRoGpJFdKe50xSLGnbuz0iCO3ExX/wvtpiXiXZij2oTbkF+IE/Aur6Zqjr+LgYlHpe
         bNWFfhO/W66UmfJR/3deWuMkMEM9JaE5OgRVIgn19fLPJnfDbOTs2TsP7VG8ARiIAsH6
         NOWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778594435; x=1779199235;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D9Gt6XZhQqmiYcCtoUmQ9rm1DUW56q7c1mBeDrSE5vo=;
        b=sv/eexwla9cjYfSPpXYvlh389BvFKhlcHhoU8tmjUxbe3fqhOP167Zk9FnzUyJs/M9
         Lo3cNEfvJRBsyjJNHoouwzFKgcDwZNQ/Y3VCwYzqA1nR5GbTZNvV32eYQakYTlIdJx9c
         f6p7g/4zYZ9b5LiC10RtkW+n/nzZCVnEfzGbSff3CiO8KPPfr0sieAPQXZsroDJx8omR
         NyzKiQc6Jfz6YJV4Nf4Envuexw5dAXA1EgwNzvhKHq/5UkKp/k5E/2dZ10ZTHMFuVGVo
         SGnsCd7BzRqp4/kZnak4M2Tx+eazsvVm3OMjjX46JLe2sF7R4sJorKFJKrRJuQcI1erI
         Sy2A==
X-Gm-Message-State: AOJu0YydtksNLwWXvwc+sUzfsX05Jy1cXh4omR+uWSrefL5/KTAbVKi/
	GrXZ1cXLGku2piO/eMaHLAPMsJdtgYHeq20AFV391Ihota77DYsS6MrS3ZkpWxMJ2rgN27GT9TG
	GM/JEEF28/Q8vyJfrpys7LhzY5iQpEps1tdU+Fb87meURsqlya0zgTJvrLGob4K4B2bqnhWo=
X-Gm-Gg: Acq92OF9v37Z1WCCr3dJyn2B7c7fToVJtN9E1PBTrJvHHeYtulBh1BKlm4m9EWpXvH2
	LG9Us8d+QN+UoytlK4SFSanxOVKG/Y2VJbb4FAi34SyNDFM3Q3ja28kRf3bvLfSC/PWxQq+Y+jK
	sOEo1oAcYAn3GM9pnTIrQdH4ir6IJxxHIgk5GhDm42JhU/+7hyOGdYX5lnoEDkmNNHh49Vw03iu
	ThsrwfLwLjDqZ6HDcatHI7dnTELeW/spGEZxhAPQW5DvrL5OyWYf5RRFEo7F+S/M6w1gPhgQ25C
	f8H4TZwHWhTLDZu1eKHXE1gNMGXrSD8PQ/JTjsyrCPHQ13xW63xRKsCgJKuBjRE5M6yJPARpqpM
	vACn55GeTZIyCcEEVsPJAr6Sh2dwDAEaf2p//j0RgZu2x1LVhw7U=
X-Received: by 2002:a05:693c:3015:b0:2e2:5bc5:f8eb with SMTP id 5a478bee46e88-2f54c0812d1mr13189385eec.9.1778594434472;
        Tue, 12 May 2026 07:00:34 -0700 (PDT)
X-Received: by 2002:a05:693c:3015:b0:2e2:5bc5:f8eb with SMTP id 5a478bee46e88-2f54c0812d1mr13189343eec.9.1778594433899;
        Tue, 12 May 2026 07:00:33 -0700 (PDT)
Received: from [10.204.86.121] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888d3af4esm18019981eec.25.2026.05.12.07.00.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 07:00:33 -0700 (PDT)
Message-ID: <2d982640-1f8d-47e1-b626-2e40d69eba98@oss.qualcomm.com>
Date: Tue, 12 May 2026 19:30:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: venkata.kota@oss.qualcomm.com, kssb@qti.qualcomm.com
From: Saddam Patan <saddam.patan@oss.qualcomm.com>
Subject: qcom: Add cdsp1r.jsn for sa8775p platform
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zEQigrJPoOKMIxP1JRNQhwA8EZB3nduS
X-Authority-Analysis: v=2.4 cv=R5kz39RX c=1 sm=1 tr=0 ts=6a033283 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=qC_FGOx9AAAA:8 a=8nf6wU7wZ6VZlyLmeJQA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDE0NiBTYWx0ZWRfX9h3oLDonyuEH
 skB4OVPcePblMEb5Jr+FMHpGUh6vYgxnz3RapPcw41oaJ/DRQkogBFvIHb/7cyr9SnXpoL6jpYH
 NRbDqo6J963J9lKG6rm3J7dqfZvVreuMkrC0X2OND9uNIkUNDI7+SYowrZDJc+7wVgm9xeLCi1r
 gXvtjVhFgSS+AOpLp/WRiv12JLV7thZoRfDSqUiFN63nrkrdcJBj76thrV58nS3vzZLfhMZcomS
 rNbL8H/IXGJNN5fUdLlHwaA5kYjpW60AHcybzJMFv/hE3M7SXqIwDpzJXZWEzrGem+GcdjUjsTb
 iCy53DRqC1wjWTJ62tbrX2tLweqbb95+xkqIgH+qsDa3FgaZtXbLymwUF4kcm0OZrL1aXGCIQyc
 L0xc9Tu6fT+Xqml8rD1FVeCbbGeffjK3vyyp9BiGcv91rzSXPa7q7qp38rl+2MoKrN4NXLB2zT9
 1pEh/hOy83Sx2PbmNNg==
X-Proofpoint-GUID: zEQigrJPoOKMIxP1JRNQhwA8EZB3nduS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120146


The following changes since commit b965e85c15a94974d4a6390972fc1cbc1bb109cc:

   Merge branch 'amd-staging' into 'main' (2026-05-08 18:54:42 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dsp-fw-lemans

for you to fetch changes up to 6a81adce2fbb4e281a7508fffa76f8fbeed79996:

   qcom: Add cdsp1r.jsn for sa8775p platform (2026-05-12 19:08:11 +0530)

----------------------------------------------------------------
Saddam Patan (1):
       qcom: Add cdsp1r.jsn for sa8775p platform

  WHENCE                  |  1 +
  qcom/sa8775p/cdsp1r.jsn | 22 ++++++++++++++++++++++
  2 files changed, 23 insertions(+)
  create mode 100644 qcom/sa8775p/cdsp1r.jsn
