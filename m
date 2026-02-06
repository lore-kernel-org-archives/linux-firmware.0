Return-Path: <SRS0=ipw6=AK=oss.qualcomm.com=dikshita.agarwal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05539EE2080
	for <linux-firmware@archiver.kernel.org>; Fri,  6 Feb 2026 10:09:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C2718C19422; Fri,  6 Feb 2026 10:09:55 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E9FA0C19421
	for <linux-firmware@kernel.org>; Fri,  6 Feb 2026 10:09:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E9FA0C19421
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6167pSgE2490642
	for <linux-firmware@kernel.org>; Fri, 6 Feb 2026 10:09:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GGCVBekaF8bmFEYVeARJLp
	qy+qUoLpQRWFnsfRrfh18=; b=ev8+1DT9KrI6E1X9T/mu/VfxBF6LtunkCMPX7u
	7Gs9IIGEpxCi2sHbOeYCjGNB0g+xVJZiYucS/VH7/dhVPLt6XrgcNNhY3fRwSw7t
	R41Dz158FjvhpH/gEwjAQQAh5vZYVMqpj1ajkpYHbsUb+vcAjBPqJBXoN7+OKLqq
	on+ojv4AsTg/wl78gZMLewIM6R+ysQTWjfVH/5Mosejoc1RqUzQAjgDhq7TyDYMG
	KIvxho0ZSI1JQvSn2Ju9/cZGiiJFjtwokuK7vvTW3LkdZboTc4NNeNRKq/9z+rBa
	437XXu77/XxrRniSS2CRyskMkYc5X2NerIYnHU3Z9Hd6DWdQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5c9c0fqa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 06 Feb 2026 10:09:53 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a07fa318fdso21312275ad.0
        for <linux-firmware@kernel.org>; Fri, 06 Feb 2026 02:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770372592; x=1770977392; darn=kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GGCVBekaF8bmFEYVeARJLpqy+qUoLpQRWFnsfRrfh18=;
        b=WcNT0C18g1qHRixb03RBg0+UqGhCw6feJhjeTtyzSLeriyuyYayBwumoX3qya0UTjQ
         phTkletI168JDBis40o3vAh+xmSHkidBE0mtZaoGtTSL85iFIOtyj3+MLwb9pLSpEC/L
         iztTzaVMiGnLqsAfNvyPVtvOEZkWz76qufgHzjUg9egTCPjA48gpGNWvRyegDEChwMrI
         mUoCon+9hAhZOacWQecoJCkNqceNeUySWhx4XWAFbnMrqQEOAK1gaG2/CIRX4vOFHdmR
         jSAUdxR4QnU8L6zGJ7oLZJH3y9Q6C8iFdH2AEfh5Z7V7ewEW+GP0odi0lM+dIMKzqXwy
         O3xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770372592; x=1770977392;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GGCVBekaF8bmFEYVeARJLpqy+qUoLpQRWFnsfRrfh18=;
        b=ZVyGNRqCp57+/jOoBsI07SYI6Hjy64GwmdZZvaDI4C7Bt9FdGn0XcURxvPqNTSPlX7
         ubUoYCoCjVRn5/y5Wp1pZxgVDp8P1Mr7LfVA52rWBX4nAxLoswkyVST4QILxl9AQW2mB
         rhVegu4IAvYVrjh1Yi2NRdZxHspVq6gGxTr3i0nTsFtktKpk4sTfyzdS9JaAWngcjPJQ
         7S7PJXF/ft8w9SDw3j/g2CBRK3gOyaGKGojUpPPHeSXoGKhXgzBRMFMyX567nC8C09wB
         KZtyHOVFeshdbynpsDE+8kDUhw32RdN9dihjJznhcVxgFVoES425eLE3WBgF59xm0rQx
         /A0A==
X-Gm-Message-State: AOJu0Yzj34JzdapEXMAmNGqr/TjHF7QLsa9RERTQTC7txXUhmLiSkGTS
	pQZA32cv81g3RA9NKT51Jd8Ef9VtgfKKrXq35pA88Vpd06+8Zizy5FYH4fjXZJ8yXxykYmnIKQn
	nhGVws++qikKlydX5KV7LY88lGtgcYEHALYEYi2JrmKsM849yG5GV0V998xtL+KncwkHROG8=
X-Gm-Gg: AZuq6aLRCESiScAgLKSIRoFaQJKfWQAkIAyAiNFK+sR7gbp4gZowPtARfCJsq4iu4+3
	pwXc2qtqDDKm5hmJ6iCrMbCQ3tuUCqe+P7Nb1BNcAwiLZZi2GAdQI/J5iX9rVRsZbBJKovTI9Ol
	yulQCIuJK4xelS8vSePqhdIhsXhJxmPSBwL6GFjQQofoRBg4r3ShQAlhC34l3wNve1A7sRj1gyG
	hevZWuSGf0jh9t/fDvnHThZ18ANmxg4PnQDPuPKjajdSftGqDIaxin+ItVlJE94qy5Xr0ygU8wx
	FcinHMXa5TblJcGwzDq8+Y3YzVKX1n5o8kJdsVNLzqEDiXYLp3lqsbGe6aCn9LUTPonL75Kl2EQ
	vk8SNko0W1cGuOAj2LgxgmdfUBE1BpA5iKnZE1q234Q==
X-Received: by 2002:a17:903:230d:b0:2a9:4369:6426 with SMTP id d9443c01a7336-2a952284edbmr24022055ad.57.1770372592478;
        Fri, 06 Feb 2026 02:09:52 -0800 (PST)
X-Received: by 2002:a17:903:230d:b0:2a9:4369:6426 with SMTP id d9443c01a7336-2a952284edbmr24021665ad.57.1770372591973;
        Fri, 06 Feb 2026 02:09:51 -0800 (PST)
Received: from [10.0.0.3] ([106.222.231.166])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951c4d8dcsm19197645ad.9.2026.02.06.02.09.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Feb 2026 02:09:51 -0800 (PST)
Message-ID: <9f708bc6-349b-24ce-0930-2982ed490c88@oss.qualcomm.com>
Date: Fri, 6 Feb 2026 15:39:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Subject: qcom: vpu: add video firmware for Glymur
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BbzVE7t2 c=1 sm=1 tr=0 ts=6985bdf1 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b1PTopwMF4WvgfXJboyTWQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=qC_FGOx9AAAA:8 a=qi05sNpRTh4_F_nyXQwA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: mjjV52Ko9_RE84macsLS2K7aVNFOSj77
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDA2OCBTYWx0ZWRfX9ZaT27t16KTP
 aaILAGBjI846qJ+PfDOH0EMMgl81Z0nAV7uZg9Soo1OsTdzvTVm0dvz1QGHPlxZJMl/0EyoXqRk
 oqD0vzJAFDyU6qc+ThDmOEcYL6ayJCx1YWbey1Nt0ZlAvUGvqkWZMeedAjQzSbSmgmUw5PVLliu
 B5DSz38kH0W0AawaRgQuYem+E8IVrg8Irogb3ccuuySMEkaHXPyXL4aa9aOSLxESjH5u/osogDI
 1J4OgojjqvSIfAIicVxqWG0/QuIj3xUCxIB4w35o0K32QVJYu/ai0nHRaK5s2r3/PUSO60Y0Xz7
 L2hCyFIUdcvvQwwl6MkE0IIiJy1YZoX9aHS5zScMWeVlDLAuRViGKM5E7PTZAgRzT6WVhPbNuy2
 QiVeMqDMgYMS+PAYwhBbfBpEcF8C7vU54qhv6YH3Lz8ZqW8f1pM1K1p0MnGMvjxNvD/MuBBJmji
 T7ikCUsOcDi6yk3rm1A==
X-Proofpoint-ORIG-GUID: mjjV52Ko9_RE84macsLS2K7aVNFOSj77
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_03,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060068

Hi,

The following changes since commit f2dbd7a7a74be0d309d8058a55308dcea33a41d6:

  Merge branch 'robot/pr-0-1770355730' into 'main' (2026-02-06 07:17:03 +0000)

are available in the Git repository at:

  https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
video-fw-glymur

for you to fetch changes up to 2bb21553d510073cff360555692643a3cba24d11:

  qcom: vpu: add video firmware for Glymur (2026-02-06 15:35:34 +0530)

----------------------------------------------------------------
Dikshita Agarwal (1):
      qcom: vpu: add video firmware for Glymur

 WHENCE                   |   4 ++++
 qcom/vpu/vpu36_p4_s7.mbn | Bin 0 -> 2503368 bytes
 2 files changed, 4 insertions(+)
 create mode 100644 qcom/vpu/vpu36_p4_s7.mbn


Thanks,
Dikshita
