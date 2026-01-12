Return-Path: <SRS0=WwDY=7R=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3027BD25038
	for <linux-firmware@archiver.kernel.org>; Mon, 12 Jan 2026 06:08:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E4C8BC19423; Mon, 12 Jan 2026 06:08:45 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3DC07C116D0
	for <linux-firmware@kernel.org>; Mon, 12 Jan 2026 06:08:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3DC07C116D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BMBnmB3118447
	for <linux-firmware@kernel.org>; Mon, 12 Jan 2026 06:08:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=l2IvM7fUXBaEjFLyvIF/mF
	JLkbJ1JdAQiznM38BTj8g=; b=P4wPNFTFmngoQDVAl7Z7R0iZq4WRHaQa/tsUT7
	SB913jWlSgPVFtk8VxJPiVC/DZ+0g5Yrl9CBse2VNTxWTok2XtfMHi6zmedj6/Ek
	Kwbbxy8YdtmOyPz4OrDyunAx+09NrwFTP/IoeDnB7I4fuO5vYaFnDjLmICV4abFG
	WNWlxjknwe8Xp6SdLNHvT3oOBHYiKA+X81IJqOHTyklsTysTT8j4uCdUjE9NvhFb
	U+fvvnEzP9bk473nVjt5fc8Ih7qg8SXKhnWC4dbI0pqqKRvj8mMGOcAsndUs+9gk
	gR33ptpeUhyddXRK5DJT34DwwkoA7lex/UrCSJDMN62rcYFg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkntuk5m9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 12 Jan 2026 06:08:44 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a13cd9a784so53618025ad.2
        for <linux-firmware@kernel.org>; Sun, 11 Jan 2026 22:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768198124; x=1768802924; darn=kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l2IvM7fUXBaEjFLyvIF/mFJLkbJ1JdAQiznM38BTj8g=;
        b=ImSxBMda5/yiuAZ9Rl+WGMMYgqwVl5rBeiW5vqsXFpiujaSvmb+p3y8ePneukTFy/D
         1EDNPGrAv//u0AwAUN2aEKaVTF7qZymzo3UtzdWFygJ91N5wa3vb+KmlSejWzRKpdW2e
         ogk7ealNI415KBzmxWYuu+Q8vI57/J+MIyO9UCpS2rpx64OAxX21SNWDruJTxEBvW+Cd
         d6Vb6QKzIAVdKljuFhcpjtulpATgdpbOCzBQmEr0Msh0U8Mo/DKT28WfbpPmOlv+M0R+
         umm1zIKBbHkNUy8NKGtaz9bKI6LSOGCFv8RWLBwjbsU4+3KpXkA64VVf8LxXPjIQC5d0
         xMlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768198124; x=1768802924;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l2IvM7fUXBaEjFLyvIF/mFJLkbJ1JdAQiznM38BTj8g=;
        b=V184CRND6/SX8b/Uisf8Pe22qelRr7j/smcfTEHfWlcaTnERMHJKJdaOV3DV1U8Kfy
         phpifLkOGDI58hL2Si72OXjMgneWjM0VMHytebeJPZs6Akdnn3JGl+XkkbUgfj6ITSom
         zGMDrapU8TMwLOS/LXGKIQhlESKMJLkabao2ORuFXbXGCzCRAx2U5qQfCsrDKnjfiyLO
         qvzgv8PErzUDueo3wE2tGYn4ZzqvUCz1Y0d8Jg+BLcDKM63hlDy6TOulUEV54NFkUZ5S
         4SfofdEtPRhbuy/cQ+DympEKYqaCvpBd+u2iMxunptardC+x2Fsl+hzhsw7v0D247J6c
         dtzA==
X-Gm-Message-State: AOJu0Yxx2GeAqBiJtNT5UJqSftrxSJMK5BfSU3S6xXR9BFlz7fJO2iRd
	UQY+UQLF3F4Rvrw6fyI9GDHEsoIoEmTzquSKi+XwPvzYgyFxHnZZIrr8cftaDjxkwYyPY3PxZ5l
	EOgBVSjBHMHAwW69PGuxzPl+aHAIq6Qjz7J4wJb32gRREfUdGMYuXuS6cPrmPv9s/xT3D41I=
X-Gm-Gg: AY/fxX4OmhmhqxeWRqAFCI4CR+shC+Gnf7oa4HwLy9KWp8gY2YTjqMUlQtW/LFE5mil
	vAMEboM8fXucjQoiASIELg/HERSWKdqLxlagzCPPhGoNhhHn34aw5kKADshRO4a5GEorMf3l0/c
	Kv1ZQO3PbTZyZ9pCDp3Zt77mc93ewwZVJA/UzNHCQx4lSr6MfMbvhcaElBekUXda/JFeeTPTBlM
	E2UHBatj8Ext3fZK8VP2CwdA789j1q6yduMWSRTPKQnUxEXO6Pi6VtGZi5XZkEPn4mYXHD+hI9e
	ERGn9rzSVvywc5oqYjlJq7eyamnMYF3oQrZwRrL+5EiT/O5vqJf4OycENBdZEU7G9XgfBWnPm3d
	wF4cVXbqkwxLLKTgxWVtFp/uGEtquth7RdjEoVA==
X-Received: by 2002:a17:903:2383:b0:2a0:a09a:c31f with SMTP id d9443c01a7336-2a3ee41d11cmr139776005ad.8.1768198123648;
        Sun, 11 Jan 2026 22:08:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHqu/alyAwqEyQrgkbTbxsss5dcIxcu3vY4hSB/LvyHMDmzm74l1FmaBsuqdkbQ3Tk3JWBeQA==
X-Received: by 2002:a17:903:2383:b0:2a0:a09a:c31f with SMTP id d9443c01a7336-2a3ee41d11cmr139775915ad.8.1768198123089;
        Sun, 11 Jan 2026 22:08:43 -0800 (PST)
Received: from [10.204.86.35] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd2906sm162443125ad.87.2026.01.11.22.08.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 22:08:42 -0800 (PST)
Message-ID: <4c7be2e1-98ad-42b6-bec7-6ffde9a9951c@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 11:38:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Subject: qcom: Update ADSP firmware for qcm6490 platform
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA0NiBTYWx0ZWRfX5XDW4hkzTDpw
 HBmaR6dIr3neb9mjnkYOjJiLUW52d78AU/HacactYZbKt8mYrhuA1m8Bc0gvJ3Olx9a6Z8PoorI
 DZ45FSsBs0OgU/WuFk66EQzAbitFJQpGIricTL+Y7pjXsUGK669mzUoIwW6RIf48OwL+O0geEbw
 Cf/JjKGRRcrIUIX1qL8rdkukbYCtWlPFQ0FpLn1RxBexBLwqQvbd3atVVrupSkwoUjBD/K1S6hR
 SGVwoCnSINCpzhITPIucgJpx+9VCtnIJ8khuoBbgMMO6dNrzKOzShdEO54986juNcDq2cX1KqvR
 E6X2u6KDJ8zhuDD29QzvbeugwRAN1anc9wBk5+XNV+33l2UiijIer7a9fnWWeOg61Qsf1oLuRq/
 /5WYKeBUr9IXO8LjAk/ujKTDk+z1UN7/3avszH2id+Yz/yzS8m3c1TOyWA0MpYPNLDzY2kvGEAG
 MEt9ujVzxtqlXEofu9w==
X-Authority-Analysis: v=2.4 cv=R6AO2NRX c=1 sm=1 tr=0 ts=69648fec cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=Ogdz_8zh5y0U7vwWOyEA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: ZPaBAnDD_JnCGSkRKDxUt9G7vrnvKkpa
X-Proofpoint-GUID: ZPaBAnDD_JnCGSkRKDxUt9G7vrnvKkpa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120046

The following changes since commit fd6473795fc677b981a076e12ff10044d3e5dfa3:

   Merge branch 'main' into 'main' (2026-01-10 20:55:47 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dspfw-kodiak

for you to fetch changes up to a438fce32e0e406fc76f9631da88c4d81a95a010:

   qcom: Update DSP firmware for QCM6490 platform (2026-01-12 11:16:10 
+0530)

----------------------------------------------------------------
Venkata Kota (1):
       qcom: Update DSP firmware for QCM6490 platform

  WHENCE                |   2 +-
  qcom/qcm6490/adsp.mbn | Bin 12693084 -> 12095036 bytes
  2 files changed, 1 insertion(+), 1 deletion(-)
