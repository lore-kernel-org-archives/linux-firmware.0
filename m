Return-Path: <SRS0=Fhox=7N=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A30D7D1489A
	for <linux-firmware@archiver.kernel.org>; Thu,  8 Jan 2026 04:36:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 67E7EC16AAE; Thu,  8 Jan 2026 04:36:53 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6D068C116C6
	for <linux-firmware@kernel.org>; Thu,  8 Jan 2026 04:36:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6D068C116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6081x1Tk126050
	for <linux-firmware@kernel.org>; Thu, 8 Jan 2026 04:36:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UZOUx4mZ7YP6FVXmSTLaUt
	Dosuodu0t+PC03y/WoU74=; b=FGk8IDfIRSqPHMBYC+shtIlvmySVzO7cqAU2dY
	YBSbaQDq25Z54VXsL1KiQRxMeR2jbo2M5+ZaGPVHqiWsSU83HEKWSTyYcPOCdWbA
	r8P4jxW27Y83fTRFvOF7Kfp5SnRRqsR41O/rudCoEU4rofrhfoxZ5eHg3YiT9o31
	M+oWLLj4bMZL6RThFzXEtyoxCBr3ncBUpVbAT+SLZnueWdiTg3rDUa0qGe55c7KV
	lIkefbTRt++VIAI8TgSPNPMISvbgCZ9Q4y3G0ycF9PKB0NkGoUOfdLr2QLkb1rWy
	lnnNlqSzdph7s/fLAqQvR1MQ7HFyp9UpP/qTvHdg4Hsig6aw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj3d68dv3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 08 Jan 2026 04:36:51 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7aa9f595688so3678867b3a.2
        for <linux-firmware@kernel.org>; Wed, 07 Jan 2026 20:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767847010; x=1768451810; darn=kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UZOUx4mZ7YP6FVXmSTLaUtDosuodu0t+PC03y/WoU74=;
        b=GMhW0bSAH2C2f5C0Gp8UrVrwe3rSctJJbVyPOgO8nimLLcnULjDf/gJ1lKBDSTJ3SF
         hQkvxXafvFW2s70w6HTQPJGn216s+5IpF7g2Wswu/pyiX2PsgvpgradjpgC1LIHqs26p
         rjhZdP1IZZIGxhSX/WtL9T+/2eekqdhPbEbQs1Y1x9A0/duUKWgQIyCVFxjOb6QMDjBb
         euVczDdfT4Bod+i3LOjash4ViNkM0r1Y0Rlq224q2Ezcpb3eP/KlZCaieKIyLya53IrI
         UiHJ+vNuHvaAHkr+aBAG7WebGOtg3LHYJByz7k/XKo0OgNDypbd7G9Lq7ijQSxBa3igl
         K/cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767847010; x=1768451810;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UZOUx4mZ7YP6FVXmSTLaUtDosuodu0t+PC03y/WoU74=;
        b=Km7Tb3an0QbED4mfFzCHjA6nEfdtUYU4URDGcL27t+xwRxNfxjhkAlznvY0AR9d4s5
         qpEr/n4WGaG9Gj4EGjl1logQdvwYWAHB2X5GyZ9nmI1rg+3kW9Bqxs+zCgZKd4+HMO4L
         D9BXOqhXBEcKllFm8Tuy93HxNEGmmYfCae4+ySZ8ss9yaEQbuAD0TMb/7XGytyk/1ulH
         24vyls4d5eV0vv1+3VNxuB7CQAB2ujX6WjyyAD20nlXr4tXksPLJV0k3AOcAJFmb6Mls
         iOYajdDZ9jKHXCNghyLuB0DKLVVAcDttbRKJ/KZLCJlOWJoGNKxOUoMMmTWHldS2ZByF
         E23A==
X-Gm-Message-State: AOJu0YwF+Hl0bNi9A7rKbXOuFtHVTewwfjkDolMHczhqiZq6DHhDM7Ss
	RiA9gc8+PdsjUQad3FlKjnACZs0NucknJK93zu2VMlIZ1rL4fvCmYS1YS1bxsZr2Y8Sg6W/vh4M
	9LnLREejB0M0qNLxPQwt+3/jLwsnVuK1xQiSzjJ6yatDfJUN7HbgKvLHRPkiklQHbVHvxL9M=
X-Gm-Gg: AY/fxX7HND2u/xSbNo/RjNZvmyHPX3pYkCG6mb95qkqJyxtX8PkGEeMKvObwFk+AHVE
	vgEKL9bBqwlctZHk3z5x6NUO5Ct2fYt8pYi17zxRvJJdOq9BQCSYABP1jHib84VIraqpkiWCYmA
	hhRpcvUvQq7qUIEK+A0U2raa9LAl2Jj1Z30fUQjWo4Yd+Lvuxff9D0fgDy/ojzkU5+GmSpztV2P
	XYOBmdXTFigXZsZH6c4458xtazWh2iuH1PfufrSuRnlCrgkx9ZpA/bpjrmCgQES+ZMj3AtpqYWu
	s7L0crddtRfUwKxu5pZyKeg9BNqIPzdlSmmTdIF54qvcBW+VIebbH4Mas0KEadr9rEcdE0gQ716
	O+RehRWyCpUbh1+yxyItF6wHRHVoxpgqkZs8Rne8=
X-Received: by 2002:a05:6a00:ab89:b0:7e8:4433:8fad with SMTP id d2e1a72fcca58-81b7fdc350amr4612420b3a.53.1767847009966;
        Wed, 07 Jan 2026 20:36:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFNKxoi1PbeRtCzb68VGXmL/1WerWCNUFhx+lJIQEmE7pHIQXZiY3HuXSzimnUwHg2ZspszHQ==
X-Received: by 2002:a05:6a00:ab89:b0:7e8:4433:8fad with SMTP id d2e1a72fcca58-81b7fdc350amr4612400b3a.53.1767847009453;
        Wed, 07 Jan 2026 20:36:49 -0800 (PST)
Received: from [10.216.52.188] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cc96ca828sm6725909a12.28.2026.01.07.20.36.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 20:36:49 -0800 (PST)
Message-ID: <f4655e94-b451-4dce-8b25-e27b6749d9d8@oss.qualcomm.com>
Date: Thu, 8 Jan 2026 10:06:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        psaddam@qti.qualcomm.com
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Subject: qcom: Update DSP firmware for qcs8300 platform
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: l2T957IF5qZnhJX-K6xkEEFEE4C9ntWm
X-Authority-Analysis: v=2.4 cv=APfYzRIR c=1 sm=1 tr=0 ts=695f3463 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=p0u1EDmB_SlldbVHfpgA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDAyNyBTYWx0ZWRfX3yMeBMe9en9z
 fDK5gGjUZHqV9NBNWwhxAuAJKBSQkXzGP13mHp7JYpAxtGFGKOvlQ7o1ZaR+GMDDTQINWKQlZZX
 UUmQEOQsO0obZ/POlKMYEpMMMr5k0YnzqgNkyzoWGDxmMssdhDYWtwR+jdxq3gqz2hqHvrGNw7Y
 NEXRH0HLa6OyP+6yHJrdtmv9S7dUUB00pxHSKCqBZD0l3gp11Qe41c8l+h32Qr/sDwNcoACze88
 Wm6RPVQxSTO8S0HmHz61TFzDgVGIZiU8xdmo+wbeYIbRCRy1UWBkViksZ47k5JFpcFRYbb4w3hi
 i6hkxTI49TiG3mHU0Pub+naYatazcZrK3l3XX8YHlmL/63UwPfxPrmE9DKNW8SPgofMWiHi2mZc
 pUcTng+eb3UIBi4GzzLMM7Y/gehYbXr/7Xhf0reSDsltyGCE27Q7h+KFAorKhdPGkcjWUrc3AVi
 0oeUsnfFqkG/s6scDOg==
X-Proofpoint-ORIG-GUID: l2T957IF5qZnhJX-K6xkEEFEE4C9ntWm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_05,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080027

The following changes since commit e272e0d1edce58496c3917f7422b9531daeb0535:

   Merge branch 'robot/pr-0-1767725013' into 'main' (2026-01-06 19:05:06 
+0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dspfw-qcs8300

for you to fetch changes up to 5ab272be8f8ea70c01587d8da51cde1ef40c5f86:

   qcom: Update DSP firmware for qcs8300 platform (2026-01-08 10:02:25 
+0530)

----------------------------------------------------------------
Venkata Kota (1):
       qcom: Update DSP firmware for qcs8300 platform

  WHENCE                  |   4 ++--
  qcom/qcs8300/adsp.mbn   | Bin 6692864 -> 6791168 bytes
  qcom/qcs8300/cdsp0.mbn  | Bin 3096576 -> 3170304 bytes
  qcom/qcs8300/gpdsp0.mbn | Bin 5881856 -> 5984256 bytes
  4 files changed, 2 insertions(+), 2 deletions(-)
