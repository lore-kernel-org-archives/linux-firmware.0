Return-Path: <SRS0=q8dN=6C=oss.qualcomm.com=dikshita.agarwal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42DA3D1038C
	for <linux-firmware@archiver.kernel.org>; Wed, 26 Nov 2025 08:46:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0379EC113D0; Wed, 26 Nov 2025 08:46:30 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1F4A7C116D0
	for <linux-firmware@kernel.org>; Wed, 26 Nov 2025 08:46:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1F4A7C116D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ2a3Cu3706901
	for <linux-firmware@kernel.org>; Wed, 26 Nov 2025 08:46:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1A4ORfQAHO4zeHBExosbL1
	IHtFQIkDTDVHYunOJeoqU=; b=Wt3dL3n+6fTlOUG8uvluQw0OAvrOATKAiKVnRN
	J+mJAjdcPWaR3ku00+6CiiXxJ8VcKKhYET3/F59o2Yy/6s/ToE/5VsVQ1lXBK2Re
	THjxzDsoHOboNmL/k2cPFMZDY9c371YgCvLblp5wTQRa3RK7oDFpiT0KM4ar6jNT
	3D27Ki+Ooqp+IzIh60MlT8OryFtTpjzanOUcTLdJkZf7bZZ9Ln8c+xdFpx7/Ah3U
	cIxjQYp/hNyE6+W3hCwMfMgR1XeBgZz2SzOfwk9BN4YTztg6HWwjpbRBkVW0nqGd
	oAlKBUyGh3omEtkprd7JWNouQ9+cpImYsNAxAqJYNFy17kBw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anduftrgp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 26 Nov 2025 08:46:28 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3437863d0easo11213572a91.0
        for <linux-firmware@kernel.org>; Wed, 26 Nov 2025 00:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764146787; x=1764751587; darn=kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1A4ORfQAHO4zeHBExosbL1IHtFQIkDTDVHYunOJeoqU=;
        b=cliyLQCSOvBl9trRYYeXIqg2lQvnAqFDcswkRU/VV+Y34w178SU8GkAfIbTnMqEXZW
         eAlCP/kSZqighU48o5rsgE1Sfwlx8k3FcJwSAun5WZRIw+eyVB+tc+TuNZcCXazebSHK
         748YLDOOProPaTXyOvD/lYT3Z0KUHghdoXiqVWj6Xz+ULmg00/89xdgTK1pmwDUx5Fi9
         glq9YsFcg5GughkdqMipvUWQdWPNX4J7yoIqqQew55+Hc2b1/f7LwoDJlzA2IC/UMiTo
         MMU1DBLKAhDtN9fg3Kw5cy8HGo5rd7yLn0PjN/2HngpEAmnjl2uxmrjaAQrNLew85jbl
         aLvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764146787; x=1764751587;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1A4ORfQAHO4zeHBExosbL1IHtFQIkDTDVHYunOJeoqU=;
        b=Vy0Mzg9r8nUBcFiLLW0HnmTKnjkJERMbdIAXKJngfFqEStEZjVI2nwdpQXqHNATRC2
         BYFYcvzdTpajE8tXQQub5wtWNOMnRLwss375W8dJNbdsZUZ1yF7jNH+O1oYZ4JUcwyj+
         RCBDFc1NZ75z3JStsuDBtgyplyLXYupQBwZYpJr7mOIFH9/5ya5SYPl9WoaA3NaTfD7s
         0DQ0YDYzNQOD2QfMs62Jfq6h9R/J+18jScZqcKqh7Z9i7U7YDUY65u0gpTnzwfFLQu01
         pNC+THtXpLKTV7ThmhJbfufpzDkXC5cUdwUU86zMprOc9ElC4exAj2X2yCAgy3jzHRtm
         QKFw==
X-Gm-Message-State: AOJu0Ywd1kTNWu+EqHPu1Nxwv52qLBP3Kxe1p4blFfxF8i0UTTE5AyfY
	iLakAO50ZX4eFK0qEz5fdK57PBcu3ZcXRvoV+8ysS2fcyX0J8CWsRRMKuUMcvOEONiNm5xqVQnV
	oSSpoN0bWf0vAj6WlysPOR5slXYLqjau6p8hs5YEJ/hekqFZI27jD9+vMsA1+IVz1OdOfE40=
X-Gm-Gg: ASbGncvEGH+dGvCvpALxsrlDuJEeselPYVrk94Qp+ods2Azjd+RJ7X2wjSzJ52OGwdi
	5ySgTY2hrLMNA2i/p3UDtOmqSl/2WpTV+2ksRBf4HKSRQPL4aKGtXuXrKsjGYjaAVnyw/Otjvtw
	LN+boNq9mprUtEk0qB3ajHn09xNaBoDJBUYfkeJDJ1UUwvnuOoXTUilDRuL7BM16C33zw3aL6Kd
	LMSL1CGAYrDvtOFV9zBwoYxhcrS7+4iD21ODgOnEOZo9hXCnLZjngx2tdg3hucraERyOL65CU69
	0FEdbY6pY2dOeSdJysObyemc9yXZ/lu1U3zXEBEY3id+h2zVtqrbRDswABvSL25xxli4JYruLA0
	VgbDceT9ynqo/ofsZ/HAyt2TbDrsn+aZ7EqvNDMTU9g==
X-Received: by 2002:a17:90b:268d:b0:340:c261:f9f3 with SMTP id 98e67ed59e1d1-34733e9421bmr21266826a91.14.1764146786784;
        Wed, 26 Nov 2025 00:46:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFABWHxVN31iB2bYGJkrXntCAAdPMSRmfKK+l/aFsSGxXVv9nUZmnP4fUPo7G7ZlJvgLARtCw==
X-Received: by 2002:a17:90b:268d:b0:340:c261:f9f3 with SMTP id 98e67ed59e1d1-34733e9421bmr21266806a91.14.1764146786234;
        Wed, 26 Nov 2025 00:46:26 -0800 (PST)
Received: from [10.0.0.3] ([106.222.230.111])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3476a5bdd60sm1781469a91.12.2025.11.26.00.46.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 00:46:25 -0800 (PST)
Message-ID: <61358457-c80b-8940-4ed5-22601674de97@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 14:16:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Subject: update video firmware binary for SM8250
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=C53kCAP+ c=1 sm=1 tr=0 ts=6926be64 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=12FOtvgV4D2gsqRYbU+y8g==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=JbG2MJ70grqxKT5QqR0A:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA3MSBTYWx0ZWRfX6t4RyKVxos+r
 gx0+Dyn3Af6p15WbWTek6H4e8oET+MudPuNjuccP2fxq8Cdtbrgm1+Y/w3wWlLx1Lt7MCylFvVs
 7IawnxeYYuMVe2IWXYodsRebqLFcVIGmXlox6iS/z2cSphKCEnWvSeoCnjj9IslMRsTRE7vZ+7V
 0kRcK4tRu9/zAJFk9+d6aRhUfm45tGPjTHtGu+6doFsf4gx9fjvGUcfmfwR2+zyO9zaGT5hmorP
 XdqE8ip7lbtAvWfzGDGCVyRVweEoH8gPu9r2pR34fJRv0NoeAVNuvHhI8CAuEcSh7rekXgCilEo
 anw1IyocCgho6vsBK4lz2x523LTfEXzlztInq2scRzVCVO4H02Rua0XvpNxGUa5kT5wnYXuCK/X
 sNC4wjJMAhMAuiuxcHE9wxShOW7IWg==
X-Proofpoint-ORIG-GUID: wdPSpq5oJUCMuEGyh6kS60IASjF9M9zu
X-Proofpoint-GUID: wdPSpq5oJUCMuEGyh6kS60IASjF9M9zu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260071

Hi,

The following changes since commit 23568a4b942079631c9378011aa0a9b29de19370:

  Merge branch 'intel/guc-v70540' into 'main' (2025-11-25 18:40:29 +0000)

are available in the Git repository at:

  https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
video-fw-update-sm8250

for you to fetch changes up to 095130d8e395ab4b5d5e26f72cd3f0dff94036ae:

  qcom: vpu: update video firmware binary for SM8250 (2025-11-26 14:08:26
+0530)

----------------------------------------------------------------
Dikshita Agarwal (1):
      qcom: vpu: update video firmware binary for SM8250

 WHENCE                |   2 +-
 qcom/vpu/vpu20_p4.mbn | Bin 1985348 -> 1980084 bytes
 2 files changed, 1 insertion(+), 1 deletion(-)


Thanks,
Dikshita
