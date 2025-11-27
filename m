Return-Path: <SRS0=iqf/=6D=oss.qualcomm.com=dikshita.agarwal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5170BD10375
	for <linux-firmware@archiver.kernel.org>; Thu, 27 Nov 2025 06:40:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2B9D2C116B1; Thu, 27 Nov 2025 06:40:35 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 46C0DC4CEF8
	for <linux-firmware@kernel.org>; Thu, 27 Nov 2025 06:40:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 46C0DC4CEF8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AR253393840302
	for <linux-firmware@kernel.org>; Thu, 27 Nov 2025 06:40:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nhh1NVKUC4ouAimLtNPBYz
	r4KU2xzqju4bj7Vckh1u8=; b=Ay+ZLlUfaqcuAuNPbtRRJhz2p/iS5mZsurRvjn
	eO7kQVKYYmA8B1E166d2gDGyxH+K2f96MVODnVHWMuiv5SXsdDzsDG99RdHojEKj
	oUK0wzrDBP3GkkwfpXv0OJf9jX/hVT0AmrUcc2xHoP7T0RacTdA4o+5bt75+A1Oz
	qmksS/dwmLRymblXFKKg4ly/i9pq5wu2jcWEEt9R9gqM29s1lI126hYxUxTVjxQb
	8zIGwJOBCvUfKpIM91GCFOCsRNWDgNzHVfC2ETrAnuFKLZ8SqxQXqYlZOCltHT42
	JnB26KGkfZBrLwcKMtbCE315voRAdRKAzhlrQdr4MbUJS4qQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apdj08ks3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 27 Nov 2025 06:40:32 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29806c42760so19871995ad.2
        for <linux-firmware@kernel.org>; Wed, 26 Nov 2025 22:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764225632; x=1764830432; darn=kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nhh1NVKUC4ouAimLtNPBYzr4KU2xzqju4bj7Vckh1u8=;
        b=J+7A1bFynnX98TTOigyQ1LTgPRnjnFDaG7aUOtm6donHg068GRkhd0oJnMJH4Bzz2Z
         HJ0jVfsrJNJVwST5gMjJRU8AJD7Y3r9D/AhTpmA80k9h2G9oA2uyrdjzyAcaEQohO7OB
         tQ9nLuAz9kHK2I30kjn/5UmXWc0PV1Rfznj90awvk3LTF+Eb4qIqJa5QNMjynLOE/Z8B
         Wg6nLclCuDLvrcN4T2v6ksfQc9ic+Kb+xPo76r1e8wuaEXYhF5bRWD+i5AMPrJuedqwi
         EGc9a6lRfgr8YSZArwnoYyokBSu1ItLnSlzau7jZawcmTKgGHNolHSkaf2TaI9Iw2qNJ
         F4Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764225632; x=1764830432;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nhh1NVKUC4ouAimLtNPBYzr4KU2xzqju4bj7Vckh1u8=;
        b=GuMviXOvF23DvnU93XvbCHISlO1frIfYsNEC3EBb2c+Rd9ginCBaBWaMKwsw0LVzNQ
         nSsuaVb9vuag0dHsQIBRBtEazv7v/8gfU6HfCRbr/rsOZh3EZkjZ+Uc6N623RmFzdK4A
         6fQN/wue06hVGrFkvxhXy+6ZD+C+PKqmLrtb5cONE+p/D0o0fTS6zHmpk0sufruHsV0f
         5EGKejU6vP1Pw8HfRyVNAWLerPJFI3R6B5rwk6Y3eu2i2n/HVxOTBO8kenkkiGLhKn7t
         KnBHPzJ2egkDxDOGofMBWv3dwJa1kuY/B789nQwId/psy36cyfMTnwlVv+snjLZVl9tH
         YrOg==
X-Gm-Message-State: AOJu0YwgmOcIarRHeYh61GkZ6W9OQYb7Tvje/U3VK/z32pUH3TRUziar
	IxcdO/h2vk3lcxZyE0qpXPHeCEc35K3dH/tW+HLCoDeB1aWHnqbRrz287OzzEvzJFpl9VWFblpM
	GcYIbizPwzQh74i4Ma4+WzKBULvDTiZ1ElL7P78U3XUNL0GtIjoJ3nLEQY9vW6oIjGoAx8Rs=
X-Gm-Gg: ASbGnctsoi/hLhd4BwpUBZQC8eEuHNXenxUk/p0EcPSviaMdN+ARmNcs7+YtKc5NfCg
	BZ0EfPT/Jr+vmlH/EKEVgiwFq4e0Ldldh8OPr3PpdKL8PilUkORw/WowUXer1w7ZyTyMXjrI8AJ
	UqWmOc9aW3InqOY7miRn+r7yIGmqCsCVDopfAE5qJAug29QtABNIu0VDdzkSonzCiFOAeKCnXBY
	No2QEcQDLUvJzLofDkWDyBVr7xocxLz3nb8OfnPIJmN97lqDWJ2i5qBUCHgcWRx4+5nDQ9Og7PG
	/q/P5OEoKamqHUop0FrVKe18rnq5kOvdgVbg6ErxOl4Fj9TV3uyMqOUVW0k+nh/0qL6RjofIhMB
	If9QCrbm1r/FPZUzg6fdSujZyZvDJQtu28MSYVgKX0g==
X-Received: by 2002:a17:902:e950:b0:295:ed0:f7bf with SMTP id d9443c01a7336-29bab1e47f5mr110190025ad.58.1764225631676;
        Wed, 26 Nov 2025 22:40:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEoCMkmMyA1dlpA5ye3ZW+/HaWkDDUgaCYoUKsMEYU599OtisiSiwksDHxoBHATZcT+ut38+Q==
X-Received: by 2002:a17:902:e950:b0:295:ed0:f7bf with SMTP id d9443c01a7336-29bab1e47f5mr110189795ad.58.1764225631285;
        Wed, 26 Nov 2025 22:40:31 -0800 (PST)
Received: from [10.0.0.3] ([106.222.231.187])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce40ab76sm6484115ad.6.2025.11.26.22.40.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 22:40:30 -0800 (PST)
Message-ID: <4246c749-75e2-917b-0e75-6fcbc2cfff2c@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 12:10:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Subject: fix version string for video firmware for SM8550
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDA0OSBTYWx0ZWRfX4KTJymmZ453E
 dQih6CjLpntPn5ENHFFLL0m8xfJcUMdb/5HLrN2f2fbt/CrnrJsi7wnKn2JCH2U61PJIwGawRy7
 VHkfgJvgKdp62mYnCqwcTlKmVPzymjbtbg1RQSytc/VEaQSd/TM8jXcg6IL2IMjBGwLGtvdLlzO
 Qe5HUvFK43wjnzv0xhQnc+5mcqbTXZlYYff3NLx/SwTUFbQ2YDnl4p6TAX0/tUt/mI1boq+AXXP
 z6BfwbRkkbIFMSrA9Jz1q1414O+8BhTwkrHtThQAcVwuo4PkWu/RT/jGjJaKZ2+P6qMYUY7KJ5+
 TIRDlo9up3wKxuDzYpyUzHBGz+auv3xwiF8b4Gu2zpJzycrEQprIBLbNrx5CvO2tbhr4k44dOWt
 I4eO1bidrFR9zF6t8IRTQugCSl+gzw==
X-Proofpoint-GUID: 9PQ2T4eD2BB5_zMHvygTwBHpWyj5b-FO
X-Proofpoint-ORIG-GUID: 9PQ2T4eD2BB5_zMHvygTwBHpWyj5b-FO
X-Authority-Analysis: v=2.4 cv=PJoCOPqC c=1 sm=1 tr=0 ts=6927f260 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=mKDC4KycF3tA2nDQipw8AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=TurCz658bZ4BoQ7i1cgA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270049

Hi,

The following changes since commit 14d4b18b066788070c382a5ff7bfdce17ee3313e:

  Merge branch 'robot/pr-0-1764146897' into 'main' (2025-11-26 09:08:47 +0000)

are available in the Git repository at:

  https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
video-fw-version-fix-SM8550

for you to fetch changes up to c91948d8a672df6e91b2b5040eeb9b98202fad92:

  WHENCE: fix version string for video firmware (2025-11-27 12:08:48 +0530)

----------------------------------------------------------------
Dikshita Agarwal (1):
      WHENCE: fix version string for video firmware

 WHENCE | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)


Thanks,
Dikshita
