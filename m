Return-Path: <SRS0=a3Dy=CW=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99BCEFAD41F
	for <linux-firmware@archiver.kernel.org>; Thu, 23 Apr 2026 06:51:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6C8B7C2BCB2; Thu, 23 Apr 2026 06:51:51 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 03B89C2BCAF
	for <linux-firmware@kernel.org>; Thu, 23 Apr 2026 06:51:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 03B89C2BCAF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N5a5oB2631268
	for <linux-firmware@kernel.org>; Thu, 23 Apr 2026 06:51:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4OK+TQT83CrUjJcU1Mv9z5
	lnYOKTanyMxbQGJDZcFIk=; b=DGjzHva7GdeAiYR3OgIAZpudlc37ytgE2ydixy
	22KVJGtdkt9gq6dwnOWelNohjaW1E4ZubQqbMJjgbYCZ7GZ00NoIwkDGUVihL50J
	Oq4KDI6f20+UScPs527ovO/lT+IU4OFZ+60iPvZTW+9ZKRO+8YeciSSOI0ey7tWN
	4o8jVgxtIpcw90NbRzxvP6YVWyUWFqpnVameBAPmpRhlSfarkDKDYn6a9pxtYvf5
	1+F0e9H2fTnhHy1cChRRRwXJkcDErz0ZlEPtFlOuDLQtBuHfq4yg+AGOPzPYxH0l
	rs5ay100lLXtWJHH3SoSLTFiJQ5OGIRRP15Wij6UbvzixYAw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq35ra5vb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 23 Apr 2026 06:51:48 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35e59791605so6652047a91.1
        for <linux-firmware@kernel.org>; Wed, 22 Apr 2026 23:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776927108; x=1777531908; darn=kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4OK+TQT83CrUjJcU1Mv9z5lnYOKTanyMxbQGJDZcFIk=;
        b=gb6h1CzT9UNo08XCKieP6fYo1a2E2UWAmYpOvS5WVPl8x2x98zzYH2qgFswnH1pQL0
         eIpEhdwNwekO1PBVXrfJtVPi7adjRFyyGacw7vFqSc3u9bZFICl0WA1VhlFIn2FEKyNa
         GIHa6ch++fF6rOqmLriZ9gkZKQP12BHDbDr6ZnTb6VK2u6bRiSp/BnGD43bByN0+22dB
         bp3Id6u8oMajzeSpI5Y5ttnNr3TDAMMii4hbtYH0KdSs0nAVbmg/kv8avnvBYlKLnHyH
         vuPhrvgD/3dCq7yegIW5CQRwPR1YVLdUxzzXGPnJypLwPszGajJ9xmec14AcWeUg0d2l
         bFWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776927108; x=1777531908;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4OK+TQT83CrUjJcU1Mv9z5lnYOKTanyMxbQGJDZcFIk=;
        b=XouFpwjTA9OLEJi7Clt8kzE0GNV0m6YOJwf644rLLuaMTSBnO7x++B70ZRbYuQOfbJ
         /C1S0IscNJNRRrpQBmoHnC/uKQ8n4efscmMViNqnFK574yowSvHViE8vh2Tij1733BBt
         5AfXaZ1Vo62SMlh/H/P/5Wr/hRNrgr+pYxZk7ANHkyHgmhYRpeDYu3ln/8LKOudrYVAT
         bCx4Hwa70XMCF/S4hFE5Zw0oFbE2bUFjb/syHBtSTcOf+x1FPGkRu4mXEEMtYTlL3tyC
         OTad7FMVTlyjjRuTsOpQstb9n8K81WGBP5EeBaA8y1N7f+5koFnnkaOKq4C1ml4qxC8e
         RxbQ==
X-Gm-Message-State: AOJu0YzWpP+VjlKxCfVlU9g2yGRoeuNNAOgMxt9If2tY4en+U7xOlL2E
	W72l+MSrRCPYHhvsgyN9psgqvZQF0mXD6SSiPMce2bhNYx7yXm3mtA185wM0CROpfBEzIgXLm4p
	78d3noXxb77EbOMBJ3+hlhzN2g+bnXE2Veo5AmDrCrsTZxfnENJMlk+6ENH+fx2wzPUHZrug=
X-Gm-Gg: AeBDievqSAzbp4ZQCbuiZIKtCeIpHQRJXfLn7W/7IUnCvv3AbQd0dNQtdylK+WyYq4+
	skoJO9bbbpl20mkI4aTMoEGE9lQC2NwI8XjVGYG0peX9lpnKdS4bEtIV4gOzGIOynDrmxzd8060
	8Zb+FBOjcNW862vDTahH8iZcLMKRlMUOWaDsihqDyFf70HnmmujInuj2mfANgCQGwI4q8Hsawfc
	DCMEDF7E6GT5WG1hj88Z4WPPURMaX0sb6B4yh7T5EvBz1MToMUBB/RBj8/Ostawo6uD/J0+vICY
	fW4ZdWp7MmH3beWIlBbS77dKueWrZ8qcAyuOZY6VxsDYByqCUKF/lwMzUUAHU6OOWz57hM8OT1R
	/oAFQI/kavHmWDHuCzCiJaK+rWPLphsPMZllwlDzetTHQvXOUlYSt0ONuUjGo7w==
X-Received: by 2002:a17:90b:5106:b0:35a:189b:43db with SMTP id 98e67ed59e1d1-361403d5c41mr23612262a91.4.1776927107861;
        Wed, 22 Apr 2026 23:51:47 -0700 (PDT)
X-Received: by 2002:a17:90b:5106:b0:35a:189b:43db with SMTP id 98e67ed59e1d1-361403d5c41mr23612244a91.4.1776927107354;
        Wed, 22 Apr 2026 23:51:47 -0700 (PDT)
Received: from [10.216.23.234] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3613fba1436sm6997107a91.11.2026.04.22.23.51.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 23:51:47 -0700 (PDT)
Message-ID: <a53ffa62-1501-4225-b864-cdb1788beb67@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 12:21:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Saddam Patan <saddam.patan@oss.qualcomm.com>
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Subject: qcom: Update ADSP firmware for Glymur platform
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA2MyBTYWx0ZWRfX/aJGgc/aogBv
 2b0YVtlofG8eFOmq/lTSnjKupcHmXhE+ub8vyJhSdT8Qh26HWPZvu80mqQGsOEDmlwCXIumk1by
 to/p5gn6kjnH/R9verZuHxRAHF2QMn3kggqLoGH43lTwcKpfr2uB+swXzDDxyJabaLY1o2YdQtr
 qz6OUZjv85V0oMlubkJb6R7uHdz8/0hD6HDGN8dREQ+3/t6YeIStUxhHnp/sa/zf9QhuKBOzXHO
 Mf0TEVuBO8Qcjji77XL/Bs94xEZHLWGyaRV35Zi+Ej4pfivVLgmbwroYHcdH9XWIHTAKENIKxar
 +mkA8kYXRXtUSqRP7ztoyVqGmgbyqV61y5oyn80xyPr5Rk//7GEIHiY8CjCjM1b7ZmKEpJonayt
 McHT82pX08IbVKdPHSjYOV8X8LScjN2jIV3LaLI7a8D8x/ViJcXpJepOFxWgdEpQSsGOw7bflzQ
 3+CsmyWR5YdTQRygIew==
X-Proofpoint-ORIG-GUID: blY5Zi89C9ifdIN14gq3uSxA5unycj7S
X-Proofpoint-GUID: blY5Zi89C9ifdIN14gq3uSxA5unycj7S
X-Authority-Analysis: v=2.4 cv=f5J4wuyM c=1 sm=1 tr=0 ts=69e9c184 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=qC_FGOx9AAAA:8 a=SdkRTHixgpxaJyZDGqIA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230063

The following changes since commit 3fc7117bb925983bc39d7ba957ce5fafe1f65d41:

   Merge branch 'wcn6855' into 'main' (2026-04-17 13:57:51 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dspfw-qli-glymur

for you to fetch changes up to 4a74616a3522816f6f33297219f9f27cfa4e3268:

   qcom: Update ADSP firmware for Glymur platform (2026-04-23 12:18:50 
+0530)

----------------------------------------------------------------
Venkata Kota (1):
       qcom: Update ADSP firmware for Glymur platform

  WHENCE                   |   2 +-
  qcom/glymur/adsp.mbn     | Bin 18622472 -> 17049560 bytes
  qcom/glymur/adsp_dtb.mbn | Bin 233272 -> 225080 bytes
  3 files changed, 1 insertion(+), 1 deletion(-)
