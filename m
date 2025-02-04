Return-Path: <SRS0=mNcI=U3=oss.qualcomm.com=jeff.johnson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F60C02193
	for <linux-firmware@archiver.kernel.org>; Tue,  4 Feb 2025 17:10:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4C98BC4CEE2; Tue,  4 Feb 2025 17:10:36 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 11EFEC4CEDF
	for <linux-firmware@kernel.org>; Tue,  4 Feb 2025 17:10:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 11EFEC4CEDF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514E5iBH012543
	for <linux-firmware@kernel.org>; Tue, 4 Feb 2025 17:10:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SsDGZBIjvd4ugYUNZOpTcyGwaYThqVWQG2QneGzmYiI=; b=V6ted2xtAeG3Vcfz
	/pgbq9m8UEBriwm6RoMU03F58vepRS12WaPbTvg0Ca7RGl1zpnmYLMkx2DJi3mzf
	VzN+P/ZzbflfTPK95tzgcTJgSbNO5N2hUKgauqWohIBPx8FlEmnBH0VagxWeH0xo
	QFcH3eZfvqEUE4Iuh0LHeN2cRrtFaqx26td5Zhyc5Uvgp2GwJGombRyh0TAuBbFf
	aaCk7FqLAbo+0O05xqQzd5G9Gsg+LrsK96Ne5RMoU9EXlBv8fOPj3Kui9lBRQuSm
	LnDxi5G4L8JVZSV2Ryll5/EL1xHbWbBrVz/3+3zs0yI4qIINQk97dhbra4SzSl8V
	krFarQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44kmbt8fns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 04 Feb 2025 17:10:33 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ef9204f898so10953361a91.2
        for <linux-firmware@kernel.org>; Tue, 04 Feb 2025 09:10:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738689032; x=1739293832;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SsDGZBIjvd4ugYUNZOpTcyGwaYThqVWQG2QneGzmYiI=;
        b=oQvkWLXxxyuXbtqds4EFlQ/UCCh4x9t0YMEnBGTrtV7eARhFX3yHEooHvug+G9Dzu4
         JpOjR2eIJjMB4ybQER/C9wvNACsq4AToxFsFe0ZebuKOkWK/yWWm3RJFx7y73V9GRgFU
         G1uvjeEnfjHwqyjIwJihRQaXILCCs95845VDAsFEN+Bd4TtXusMeDFuX8GyqQd/1hnTI
         yS3n2KhRZa0IoUGUYH3ILpHxdQGXHWWEAPGtYRf6w1RHoB7Kzh+EPSK07G9fdNuflfP6
         BNj6XHJrGShGOiRgmH4ZmkZC0AwkUlBUQDQqR6PhDBnK2NVXZX8GMOkxFj4woAz33FOg
         yOew==
X-Gm-Message-State: AOJu0YxE+DGMvF81DORnWBMaxQegs8bQ49F78DE1k2U4gKWdACSZ8Wnr
	dGNDylTokYxLeIt427Pfa6KFrWQSOrXhrKVqpF+CYPwAt6bcrSFjg0dd2g5GNjyphLrXYsYG2Tf
	kmCLCeMzQ41oXDnBTRsMZy1VxCH1ldYrKv8RXJBn46iGnPbZfCLnQHljnt6o=
X-Gm-Gg: ASbGncuSbMZArrX/gV8Apzv8rwq8gPzU1/1D3GaN7VW1zpEE9e3kxafupimGoe3RJ8R
	Ttg5F9RMMQtlTZ0OCbMANEk4cQj65TycwohHBDQSt9XzmDHI03X9cAhOPN2bLucY4FkxdJbLcS/
	IlQiO8ahJKsbP075UvfKJvRW2c22OXWO8GD1h7tiavIjn6iFWu0Gt60/9hQoadC4GXLf0IAmh6N
	7xjqSK0XWBR2MmXq8GSPx0RsUfDvs4T6XJRyycN+Ax/4OY9d5Kv9k0mLj/dVaOoVq02kNWCpSBc
	+8d1BnpiE8EG3c5tFwwbC/OLX1rn4UVWl1HmFUMzHx2Q3TSXp0tOouN2UHLm
X-Received: by 2002:a17:90b:524a:b0:2ee:90a1:5d42 with SMTP id 98e67ed59e1d1-2f83aa82299mr48464919a91.0.1738689032157;
        Tue, 04 Feb 2025 09:10:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFzCWDkniKX+zBYsFG2EMNZzOthXO5bVaro8s2OVGW75t4hi0RRGwvhIGBaMTmjQdoebzT3Zg==
X-Received: by 2002:a17:90b:524a:b0:2ee:90a1:5d42 with SMTP id 98e67ed59e1d1-2f83aa82299mr48464875a91.0.1738689031782;
        Tue, 04 Feb 2025 09:10:31 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bcd19c6sm13781967a91.19.2025.02.04.09.10.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 09:10:31 -0800 (PST)
Message-ID: <8bda08e8-e63e-4dc1-95f0-793cc5f4ecb3@oss.qualcomm.com>
Date: Tue, 4 Feb 2025 09:10:30 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath11k: add device-specific firmware for QCM6490 boards
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, ath11k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, Kalle Valo <kvalo@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20250201162052.3858294-1-dmitry.baryshkov@linaro.org>
 <Z6JHWMJFPB8mJfdw@hu-bjorande-lv.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <Z6JHWMJFPB8mJfdw@hu-bjorande-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YSkFhrHnjUr1uS1a2Tubd6nvg8XY9wAH
X-Proofpoint-ORIG-GUID: YSkFhrHnjUr1uS1a2Tubd6nvg8XY9wAH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_08,2025-02-04_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 adultscore=0 clxscore=1011 mlxscore=0 impostorscore=0 mlxlogscore=883
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040132

On 2/4/2025 8:59 AM, Bjorn Andersson wrote:
> On Sat, Feb 01, 2025 at 06:20:52PM +0200, Dmitry Baryshkov wrote:
>> Josh, please give a couple of days to let ath11k and MSM maintainers to ACK or
>> NAK this.
>>
> 
> Acked-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>

