Return-Path: <SRS0=sInG=6Y=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49C3ED68BDD
	for <linux-firmware@archiver.kernel.org>; Thu, 18 Dec 2025 06:21:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1A56AC113D0; Thu, 18 Dec 2025 06:21:37 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3FFD4C4CEFB
	for <linux-firmware@kernel.org>; Thu, 18 Dec 2025 06:21:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3FFD4C4CEFB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI3aq1n754987
	for <linux-firmware@kernel.org>; Thu, 18 Dec 2025 06:21:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lMU12otujW14LYopbaRHAC
	+516jEck12S5e+f0o3jng=; b=WVv4sZKRk0BBlL1vui+ager7Vtw7V6INeVx48q
	YEStTUuEa4kCye1g4aXLp5Focpmckz/UHdNrB+ItbB7Il8qEZ5tqhQjaf/lQP6P5
	vP8THC02XXDQjAPSTADE3KKQV1mstZolzS9uHUchHKkn5uVwp1l+nricT0kLQ+/E
	7rgbF5Ut9ef9jGw7ceal2FILO1lqqJiiAK5+MM7wh3I4ycnmJ1PG06mKH2yEqAw4
	ov8kYd9diOAdma5PWUHXoP5xbueea3eLLUCRBZBdluxsWOfFuFJu85gcWeRKMUxO
	gQwGM2OgBieDMdalW3rCJ9sQxG57iYqnYik3Q7Y9cSY7Koyg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b49v0rd0u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 18 Dec 2025 06:21:34 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7c7957d978aso458836b3a.1
        for <linux-firmware@kernel.org>; Wed, 17 Dec 2025 22:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766038894; x=1766643694; darn=kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lMU12otujW14LYopbaRHAC+516jEck12S5e+f0o3jng=;
        b=ikpMY2NjLSoGbV4zWtATW/jn3BO47rqdTasrPXWwKG+g5KqAKnQwH1uvGxwdP4jzs4
         Iq01UHy0kveEKOac+Fv85QsD2do+SNZ58ViPadXAWiWlJbNJva6AGUicJTabmmhKxwtV
         oVPcGG0s68l7M8uL6448k21rSPYEwdUeX6jrG5JwaBsGeLLA8SONr0H7c2H6Zb9vV80H
         c8zkRWKQuFYNeeOHZXYwKw7tfjP1q6yUbPSIGn/Ja/JkQuTlhsYpnIOciwD0m1qdTgP6
         dYDrFSSAudITjQmtAfFpRRTnbR/C0B/HVaJUnaD4GBqcT/j0TojA7wKyhNumxxCABv/S
         oKow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766038894; x=1766643694;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lMU12otujW14LYopbaRHAC+516jEck12S5e+f0o3jng=;
        b=DjSvAiKG3YzNeMOIBlniS3ENRzwpGDxmWEDRI3SVy4fmVGh0/xQ3dVNkpV4BfcL6uv
         ZC9zX9FLEXxPyfRIe5wDIdf4zGbXfaADFiS3D/6wYGO/0JVa611/MtNdTjmf2CS2ArYb
         jQudQT1mpr0+SSBIBrkl5ZxKrkE6PIWwpZ4mr3jV6bjLBRxvbPoUpjqK6MAzbUlQI56f
         SwrAqpjV6hJVMuyLwe9Llx+dCotvnQz6s5bRkBuiEkcPKfjJcg+4X5HIY6YnKNhiT6C1
         CHu+x3nfj19GTCe+2MysMCR/Gltu0E7r0m48CiC7+I0BNPFCZ8TBvq0yEFiSFBuZgddc
         nuZQ==
X-Gm-Message-State: AOJu0Yy7zMcgsjKvG2deyVO7GAO1sVVAPMUqAZKqRUuH/3g1/82tCp3y
	dPoXTZRKq0LfrVdTaC0aRj0y/DlseE4Mm/4Oy42Hi9ju2zN6iUZAa3NLyosJpP/rsZQXB0TozMg
	ERITqjC70gjSlZOrW1zCue9Eckl32/mHyIlB2CCR9mKG0kRhD5jVaDM+fx6ck/OAJUyoN6wQ=
X-Gm-Gg: AY/fxX6ZPU8jfqtqG4WN9rLAJtp8A7lq/vc9+bRoO0VcSgxhspkI2l5rQQ8MDamNeaY
	nRHALTcJPjC/LeMJThmqvV22+/T09AUJATIik3R8i/ddzsuBs66zZJqBWDFy3+0jSRhNeCWDnQs
	7DfGH6xN1UbMg/KTETj/5m2MuDGQzi4JFYY0G57MjWH6IeDK5e7+ATiZ3AgSjxi2BxVGndZsecv
	ZRvebRJ+SMb4Xtx280/MkviTgglmoVxg4POkr8MwzILPMXKZEXl9krfAWXITqc0r9mQ7dXAWaRK
	emwXyF4gtCfyK9dASQYj9mjJsB1mmQtZngGsIdu2zlvbWIgzBsBFKv+ig70dMTzSQkHEx+5KLPO
	rNaZKuhH/C5zbLoa0pFPsSc2ECt38j+yqKC5rBfI=
X-Received: by 2002:a05:6a00:3691:b0:7e8:4471:8c5 with SMTP id d2e1a72fcca58-7f6695a335dmr18123726b3a.38.1766038893750;
        Wed, 17 Dec 2025 22:21:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHPUeLaO8DmCSHEYKipqbblKbH8gH/BKHMIWrNGjJte3GFc4T9biMLMiH7GMLWscXqxLC3Scw==
X-Received: by 2002:a05:6a00:3691:b0:7e8:4471:8c5 with SMTP id d2e1a72fcca58-7f6695a335dmr18123705b3a.38.1766038893278;
        Wed, 17 Dec 2025 22:21:33 -0800 (PST)
Received: from [10.204.86.110] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7fe13d854fdsm1354755b3a.36.2025.12.17.22.21.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 22:21:32 -0800 (PST)
Message-ID: <1f12b7c6-daa2-42c8-a5c7-690bc40ca984@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 11:51:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: psaddam@qti.qualcomm.com, kssb@qti.qualcomm.com
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Subject: qcom: Update DSP firmware for qcm6490 platform
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: nCBmxIGwOViCg2cWSKxx81AH1qA94oDQ
X-Authority-Analysis: v=2.4 cv=Q/HfIo2a c=1 sm=1 tr=0 ts=69439d6e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=yj1sxr4RbS7r7ypeV5sA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: nCBmxIGwOViCg2cWSKxx81AH1qA94oDQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA1MCBTYWx0ZWRfXwGzYcxwbDccf
 cX7sBvv8b3UHw6el2iX4sVGcsX0WLNJxxgw/u7Jo86xkwRkU/BloIoEmvP4WwWhsKMAKHXa5did
 Wc+DfunYYBJaUDdEQQPLGy/BpP3HilS0hW9GBdJhXn9WcZGZ2jGLiZ9DpaeT4aG8BwQxHeqegMH
 mWrspfFo/WPoWczp2LcC5VMUEzcEB/OkHIQuASfJW+WtaKzMsWLmgBrvuULJ2UHlGvcUs4ImSN2
 0z9lgVy0z/WjqQxEAHUntv6V8uqyQLdbnu0nJ/Slx3pTQWE2n+7XzxwtCc+zE0CMR1tlNzb9udt
 raBKNXBMYlATvmibD+xp/oQ19Z+WNOAVHZtLOMROFe6+3l5nVxvaAd8oS/d8HYve4pJkRsyhgLM
 BKHaljbxKM14KZ6zrc6VKiKMIE915Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180050

The following changes since commit c695356f6ea11b6585b85d31931bafcb10abb2b2:

   Merge branch 'main' into 'main' (2025-12-17 00:42:29 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dsp-fw-kodiak

for you to fetch changes up to dea906d655f69c09d06676132b18b74b4da83ce2:

   qcom: Update CDSP firmware for qcm6490 platform (2025-12-18 11:45:26 
+0530)

----------------------------------------------------------------
Venkata Kota (1):
       qcom: Update CDSP firmware for qcm6490 platform

  WHENCE                |   2 +-
  qcom/qcm6490/cdsp.mbn | Bin 3637248 -> 3641344 bytes
  2 files changed, 1 insertion(+), 1 deletion(-)
