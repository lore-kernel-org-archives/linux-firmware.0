Return-Path: <SRS0=JnPY=6B=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE9DBD10366
	for <linux-firmware@archiver.kernel.org>; Tue, 25 Nov 2025 21:51:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 904E5C16AAE; Tue, 25 Nov 2025 21:51:52 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BA4CDC116B1
	for <linux-firmware@kernel.org>; Tue, 25 Nov 2025 21:51:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BA4CDC116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APLVDJE3666317
	for <linux-firmware@kernel.org>; Tue, 25 Nov 2025 21:51:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JC1IoPbloxeIIZyxbIjgRv9Z
	ENNXIB7Mg78vIaqELMA=; b=hTWVYXgTPMASyX8UFghm0fWeChdHuohc1nWnH4l9
	IcrH0rCdu0bbUntM2qKxCx/ndNFRq5DLEuTLmGqV+38xgahJs4vZafwqP0WXLFZJ
	Vrm3WP83DbqGm12rjjTjVMd2i1jURYSBS2TiViQ13+vc9fHNdLbm1LYjtF4MDmnb
	dwzoP31U0uEWm1mKolhMKNK3XJQXBzRC67bja2fLxw3RkbuSug004fb9EGnPT6fL
	Nwkrb/CUhP4aybw5OOn9uhWi8go7MvBvkmrNtoVEvLUhmrA9y0/ifRG4W2dgIol2
	3T6Hh4J8BtEiWHOGmbuJmSri0ZtDj0kVZTNX2biiPwxskw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anmemr1ce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 25 Nov 2025 21:51:50 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34176460924so5046504a91.3
        for <linux-firmware@kernel.org>; Tue, 25 Nov 2025 13:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764107510; x=1764712310; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JC1IoPbloxeIIZyxbIjgRv9ZENNXIB7Mg78vIaqELMA=;
        b=EvaoXj4S7ZCuVm4wcHE3T6F802jTYXlx2XVlSsofvX+6DNNzTRS8WFdMfBYEbfA3Iu
         8PIjareq1V2b9VQT4YjffuWC71GB01Q7qKke40bGNq4w2eVnHs05H8vmBbPtWdMLP1Hj
         /JIwVhtPPgTkfXHalXHeQndXb2e/dbm+MZarcW4Mv2xVuvsQ7K3An9Y6q+1RdavpinIw
         oTq9wbjiU3ZogcGdZW/pKrcCm9q4t+IDw+XcXX9KV2M4vQ0EULkH7TZx4yM3FN1MJM9Z
         SU81aDQLP0OOVj0JFRTZx8m4CbOYTFkG9U5/0Q59o6BgAANMa5sLAq1k/TmUYCAdnsik
         P+FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764107510; x=1764712310;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JC1IoPbloxeIIZyxbIjgRv9ZENNXIB7Mg78vIaqELMA=;
        b=qkfAc3spFEON3Vk0Vz1t3G1VRgXXH5yD2ONZwdm9T+B0dPjJG/CrjomlHqyn87myFT
         YsU+TygDIU1ZvLFLuBYrF9YgGe9/OOw3HJMGygtHhPfMNWQXXUIMXGCSAU3msjCT02X9
         h37ow3S4KfitD8dpSO9braiDiilxcpDAK9dL5fwI88E34r8vJY+Kx6hOR3gsH7feSx5T
         h1XjGKX8/Qz9O6wchNtCv45DCyfGE++XfgofJ1pkw61aqEz33GJiNBRLc+Q1cQl1xWFX
         9bur2DC8sn4wJPOGfKgmODoFYN8S6L9DDOLLTtJxHj0khE+a3H3pIoiMoKqMvdOrHgAX
         htCw==
X-Forwarded-Encrypted: i=1; AJvYcCXE4OaTU7W4yXRaA3l8q5OHQcxr5hnYXTzLGT4th38idWhRN1llsiep+dN3/55QlpJ+56eSIyXtkwzzmsqTXg==@kernel.org
X-Gm-Message-State: AOJu0YwWFqyidDP76MlGHRYQkwdbvUAcQalgwUZhQCmOzlF9Ztuznz0f
	wDB7AaOuCaKbeRs/CHnzU6i2ZLjPQXw7/FjvVamk3FxKC1E74bvVU+2b2s1F3S7X6u0SKDiUHfY
	yR6hrT48b4JBlwwcpKvg3jCgzssdkvmP5cAyxHPE6cQeyYCKHNO3c90nvqxzGcrkG0ETMA1LsE/
	c0zSvciMpqwlj1poJA4MeNW37EVypTDHcA5LTqFL1wqnCBYQ==
X-Gm-Gg: ASbGnctdOP5jY33pEeudO6iW8iAnh7NzPm3p6VphgapjtWnEkvCVPDHtswWYxgfqFUs
	VSPwlZk0y10C+Bm40nmvDug6izM+brOmPU5oUfv5O08/LasLvPjdVrGB0M29zfRbaHu8+gu2RAl
	UHtacFZj8AZAYbHh4WqsUo3Xn3PY19CWX3IJmelJMcKhclbhmuoAvGYj/H1WVS6qvl6NEe4Gek2
	DwW1dGH
X-Received: by 2002:a17:90b:2b50:b0:343:653d:31c with SMTP id 98e67ed59e1d1-34733e4cb69mr13804828a91.5.1764107509939;
        Tue, 25 Nov 2025 13:51:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFLBtsdBMT8GiZa8ksHHrB1ozFTugTeXFskrVL0Jeor8XUSifKPLQVzM12x53VDl8FTJimwn63djKBAk/y+me8=
X-Received: by 2002:a17:90b:2b50:b0:343:653d:31c with SMTP id
 98e67ed59e1d1-34733e4cb69mr13804809a91.5.1764107509363; Tue, 25 Nov 2025
 13:51:49 -0800 (PST)
MIME-Version: 1.0
References: <20251121173636.42332-1-hongyang.zhao@thundersoft.com> <CA+5PVA7Y0GNKzP0BoSEiqXnr+n-_3yCwM8F2agja-p8m2zq2LA@mail.gmail.com>
In-Reply-To: <CA+5PVA7Y0GNKzP0BoSEiqXnr+n-_3yCwM8F2agja-p8m2zq2LA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 23:51:37 +0200
X-Gm-Features: AWmQ_bnX_z-YzXIRZZ03mnmAqMiSS8EHladO1gKrAK9-qzMuGmoDKQt1shYkD48
Message-ID: <CAO9ioeWOmSLUeZK_qXDGoFP2Ykf3wOaeNHtfmGtU4mTDaT1pDQ@mail.gmail.com>
Subject: Re: [PATCH] qcom: Add ADSP firmware for qcs6490-thundercomm-rubikpi3
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Hongyang Zhao <hongyang.zhao@thundersoft.com>, linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: 5vvBX_KtyWWEBSAIwbrUabGWjxl0ozTK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDE4MiBTYWx0ZWRfX2kJOnoAlnQvY
 9ruF7j9VCWMj+/L3jx14O/7iaBMzzqdGx9qqFD46yg6yvhaNgAvDK9u0j97nR/VRxLDr0g6EAho
 /glwMBfHPsKaXrQh7sOGZHZTYQUt4rGCpZWh6+WW0tTRjA8+gzQMA5AheXT2mKr97JTPQmQXR73
 Fg3TSQ3mjw9fBXSPSuI+35giZDcU8wOr89t6YbKU8KNhlarOmwFmuUujrO/r6n00sid1ZjhtnLh
 dk3dBKdiz7ncO3hIjHNelGZbC+NKZ7D/nsTbD3XaLIwpks66DhIlVECJonTFW5Iu/ipZyE/wSFp
 4fShC8KLBUkAkiQ5dru9JR3xpf8VvDBJ7GQxZSTIadd5ZtCjbNv2sltb7nx22tLAbY6u4/fTswm
 gjkBKniwWRYd33oi83R4izPzA2ihMA==
X-Proofpoint-GUID: 5vvBX_KtyWWEBSAIwbrUabGWjxl0ozTK
X-Authority-Analysis: v=2.4 cv=bZBmkePB c=1 sm=1 tr=0 ts=692624f7 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8
 a=pqXR1guJ8jUgC7qbP6YA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250182

On Tue, 25 Nov 2025 at 20:36, Josh Boyer <jwboyer@kernel.org> wrote:
>
> What license are these files supposed to be under?  As it stands with
> the patch, they're under the qcom license.

This is correct, vendors update and sign DSP firmware, but they are
supposed to use the Qualcomm license
>



-- 
With best wishes
Dmitry
