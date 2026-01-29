Return-Path: <SRS0=xQ0i=AC=oss.qualcomm.com=saddam.patan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB01FD358F1
	for <linux-firmware@archiver.kernel.org>; Thu, 29 Jan 2026 10:19:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A1974C16AAE; Thu, 29 Jan 2026 10:19:42 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C0663C4CEF7
	for <linux-firmware@kernel.org>; Thu, 29 Jan 2026 10:19:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C0663C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60T9eVwa3143774
	for <linux-firmware@kernel.org>; Thu, 29 Jan 2026 10:19:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kShZsfH37PMPSmjOTyV5aU9C96q1zQsjpYyHXBEYxA8=; b=FrS7aDIOiiRUNy9+
	CfbTjjWrQAIBSyn3nbVwcIztIGH2clGyfmqyz3QboAcZCtXI5+1DAU9leEggDMi4
	kKCoKBlO0IidiHl4+ioCffOOpvVN6RwC0tgX9LYLWJKdGG/JLedMVPNEdZ6LtLKo
	jxoxmtbNEC680hLCVjOr1bVaePCfz7J5GzHP/BTD7nXDssP2b+y8Jxdc3jAVNYvg
	7ZQXL5wB2FauC0tUrx9b8Tn75IJNKcyGI4SeGAQIoDYY5toHV7OxXW23yCQxkR96
	l4uBKWAyCnh/z0fvlhzbRjHBMnmEJ2CAQuvsM/Ju6kersKy9RWTQslnlAj6r5QAh
	u4qT6A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byqpxjkeq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 29 Jan 2026 10:19:40 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a08cbeb87eso9988745ad.3
        for <linux-firmware@kernel.org>; Thu, 29 Jan 2026 02:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769681979; x=1770286779; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kShZsfH37PMPSmjOTyV5aU9C96q1zQsjpYyHXBEYxA8=;
        b=ZhsQvBNa4+k7pNrNElNWyli8JfS4loIEOLFWTWS6btuImvILorjkjGJUZiMm1JRrFY
         PnLBB2pIkTiSsKFI922M3spF7pB64QA474IzLsQ5XFPP1gNr/7g2vOdTpPfI57YS6eem
         HcaTrDaaw+WZgLntcfu5TKN/2B4JEGtOqrdbRKBZMxAEz+ZEMQU+AXQDVvJlgqfgMrMq
         HMz2kju/9v0SW8kzUAUovxZe0O8EsZIvU8NC852uSwmAJujz41xNpkLc4kwbzRg9M2JR
         73m72h0v3Om2IuKLQyJqmObWHIbd0toHU/5pMQKn2yDEuBMuYz0LefSm3h3Y2l/zk/yF
         r0HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769681979; x=1770286779;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kShZsfH37PMPSmjOTyV5aU9C96q1zQsjpYyHXBEYxA8=;
        b=CoG3+OpMBfaOxJw7f9prDRvrUe16aOi/9rCADnTxdd3LEBmOdVQyFOv3UROQJiMaN+
         x+dDyStbsxe6qI4D4Rl7kZQxNAz5GbyPnj94/iID7MXWUGaHSXj3obr5mTXwItBUo2dl
         +6hWL6gmZXupAHd75NCGGahy0iAM8vMQKVk/wkhPsTePS/FmITsf+q5ltNvAbkmoh6EW
         PicfPj3t0nVdjRTZX7G//5D5OL982smV5ZwzlEZDCSrmas5vYzlE4A1rNr5Ygzt8sn5p
         IijNRaTwMpKSFDPr3G9E/Qo1/ixovSaSIrmYGVeD/A7UF0Nc8+33zrF2FhlZ1cUqKkE+
         OvSg==
X-Gm-Message-State: AOJu0Yz8SXmdjDsMX+MAtjSFy0wKzd3s8Dc0GmWYYGN1TcMPYlwhg6gk
	71ARwIR2kIo6O4fXQEX1OXBJ+hQQAQf5NsZwWFlhtPL1eadDC+ESAQsSIasqudKGzzHNFMMXapk
	yoTsQoJVxanVJub7fFfUiP+5t7WJqkQA5zPeBY9mhthEYztSzplWEE6Y6212vrwIOAlPPFYA=
X-Gm-Gg: AZuq6aLZSCcDoU9pygCHwpoar0Y4tkxvybIanvkU3vyAGvn8hHpL9PH0ogUw0+7cNKH
	1iAku8XtazgcW822kRFpzLCjcreTArok+Tk6PPjatu4sckb3VK1AYhzeDDA1MWG2jfgJfN2GuD+
	LYSNMkBDEiiqVGnpgDTJOcSKTvXFhBDf3UqHQy3yGdNq8m5QLiDRhLpQcobuyt5WHUdUr8EXZiO
	7g4WWEGwWE5lvVKrMUO4jSggQovgCctwLz+mL/yaPy6BwdlS6+he6GkZK9WR8xY+zacpdo5ygL3
	0N0X2zaAx/SiZWzh1Whc4A6S89YL42J2G2U+ZetN4sfoAK5z6GY8QRvpcXGZtZiYl233IQM/PkA
	8wTHs//JPDt78Z+DPk4QLZbR8x8x1pWqLuL6/fd9a
X-Received: by 2002:a17:903:2291:b0:2a7:b039:4b52 with SMTP id d9443c01a7336-2a870d55641mr73224175ad.1.1769681979012;
        Thu, 29 Jan 2026 02:19:39 -0800 (PST)
X-Received: by 2002:a17:903:2291:b0:2a7:b039:4b52 with SMTP id d9443c01a7336-2a870d55641mr73224055ad.1.1769681978477;
        Thu, 29 Jan 2026 02:19:38 -0800 (PST)
Received: from [10.206.100.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b415b01sm45436195ad.40.2026.01.29.02.19.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 02:19:38 -0800 (PST)
Message-ID: <5b58bccf-ffa1-488b-bf6b-28e19b5fd5d4@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 15:49:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: Add ADSP firmware for glymur platform
From: Saddam Patan <saddam.patan@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org, dmitry.baryshkov@oss.qualcomm.com
Cc: venkata.kota@oss.qualcomm.com, kssb@qti.qualcomm.com
References: <01d9e305-f4a0-42b7-ba22-5a9907577b8a@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <01d9e305-f4a0-42b7-ba22-5a9907577b8a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: OvvF6f-s8a6T49NzSy5zJbsms7lA2g9a
X-Proofpoint-ORIG-GUID: OvvF6f-s8a6T49NzSy5zJbsms7lA2g9a
X-Authority-Analysis: v=2.4 cv=dfSNHHXe c=1 sm=1 tr=0 ts=697b343c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=xOl7j2hWbFGfGnbKUncA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA2NyBTYWx0ZWRfX//KtrQqWVDzp
 Ps4hOY1GdBqiT0fndX3aj3eNBGxuhKNJBlos7tXRIfnP4LGbPPPfAc2UqguEafo3Hiq5Dz88Uov
 ypWO5h97rEy3sV8l3UAq0jJ7VuZU3mScToMQVztp7OhuScv6R/iMds4ktn3wxhBVbQK6Fu6GZXF
 D2TwlC5EkEViVn2XAEJnzF4DG+Y5VghLlgn9JKQJeexj6+1+mrMu5gHkJvpJD90M8d1tljkVWEn
 7N2z/sCxVFpLCIItY9nmma4K/8o0zf0JzzILcuxBt83PcznC4F05gTKv2BkLqUGDDZV9eYqgBhD
 CQBvg5kRvZUFOOrSHlwN5QqzVBLBOQJEJ2wsvxcsdoxJ3t+mCKKwY4sd2w8eWaIlOczjGmfB/dy
 PkLh9KKII9Iw1EuFHPypxL4R+/WjxIQzh14ndps7I8Ci40gZWPuJZFapgbPJxL9TJAIjfxtgb4a
 /ufOLKDgH1kUj3+QCOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601290067

HI ,

Please ignore this patch as internal testing is still pending and we 
will update a new patch post validation.


Thanks,
Saddam.

On 1/29/2026 12:23 PM, Saddam Patan wrote:
> The following changes since commit 
> 0882248d05045565bfefe1f07cbfc22276c9f058:
> 
>    Merge branch 'lenovo-ish-uspstream-clean' into 'main' (2026-01-23 
> 19:26:31 +0000)
> 
> are available in the Git repository at:
> 
>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git dsp- 
> fw-glymur2
> 
> for you to fetch changes up to 6b573904745830699030541b01003e6fd1ca294b:
> 
>    qcom: add ADSP firmware for glymur platform (2026-01-29 12:15:54 +0530)
> 
> ----------------------------------------------------------------
> Saddam Patan (1):
>        qcom: add ADSP firmware for glymur platform
> 
>   WHENCE                   |   6 ++++++
>   qcom/glymur/adsp.mbn     | Bin 0 -> 18622472 bytes
>   qcom/glymur/adsp_dtb.mbn | Bin 0 -> 7253 bytes
>   qcom/glymur/adspr.jsn    |  22 ++++++++++++++++++++++
>   qcom/glymur/adsps.jsn    |  22 ++++++++++++++++++++++
>   qcom/glymur/adspua.jsn   |  29 +++++++++++++++++++++++++++++
>   6 files changed, 79 insertions(+)
>   create mode 100644 qcom/glymur/adsp.mbn
>   create mode 100644 qcom/glymur/adsp_dtb.mbn
>   create mode 100644 qcom/glymur/adspr.jsn
>   create mode 100644 qcom/glymur/adsps.jsn
>   create mode 100644 qcom/glymur/adspua.jsn

