Return-Path: <SRS0=5SI5=Y7=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC07C71135
	for <linux-firmware@archiver.kernel.org>; Mon, 16 Jun 2025 10:56:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 89BCEC4CEEF; Mon, 16 Jun 2025 10:56:13 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 99456C4CEEA
	for <linux-firmware@kernel.org>; Mon, 16 Jun 2025 10:56:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 99456C4CEEA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8gKLa026338
	for <linux-firmware@kernel.org>; Mon, 16 Jun 2025 10:56:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wiHRrhCEwrs9ZMKu8RHWXDe2
	yKXoxI+qlia+Xhy9nJI=; b=cSstGGeM3Cog4INf4KNbh7OJUEmAvsoS8IR7g8GI
	At6K8vAJEG/HU61O3YC8pS4CCNkobGfmYT6ObKARveIvq4tpKbVLmiArPdUqJ5bb
	Lk6wcCkNQQkt9KQoN8irJVfXIGkw2alxJO0JCgJUKmmWejUuVUH0xkg9ygGGsqq3
	MmxPkrDjXmF3FtwkgTtNss78DIRtxrQDV3by8Fqn2DIkz+R4bKgedPLTyyU/FRK/
	9UHeK8bUwTWp+59aw9PKYYc5b3P0pcSyEoKzKjn43DvTJrawcbYp+ZQbCH75Rlpn
	hTDHsAR+Cciih3BJ7ytZ2Stq+a9anb7GnXM/8E9EOIErCA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hfc7ya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 16 Jun 2025 10:56:10 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fb1be925fbso76141706d6.1
        for <linux-firmware@kernel.org>; Mon, 16 Jun 2025 03:56:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750071369; x=1750676169;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wiHRrhCEwrs9ZMKu8RHWXDe2yKXoxI+qlia+Xhy9nJI=;
        b=qrOy4oczFf0qOBQIdCfhqR7CY9LtRZ06csDwTf3NdSq8vPvAsZLZl/sGmFa9GrbC55
         MRdysIkfUE50r+gUOpWTDqOfxF0YmzVgSegX12KM39bouXkyZQU3GbYpSppQV7X5dpZv
         zJ2LfnYlwfqPSil1Na+Bs/VljAumFnti5+Pi5Y70Q8Tt3V4aA7JMIDFGqjZJyLDoDuB6
         6vD3lDoJMs1WBeuf5FcUEUlZm1+a4FyJ5IF7L45NnOIwOPo8hw1hSZI7LJ8n5zVV4UD+
         yyCGWhIpSyCEKNgmI4hsPwPg93t1AyhzgceYu1SEhPDpAaVzOfAodj+UYpPyDSh0LzeJ
         yM4A==
X-Gm-Message-State: AOJu0YwSOA3bFzrDhYqMtDKmvxAc55CF5MWS9ZBK3q2U7JXqTXf1P/12
	KAphIFqG18eLwRr6LADd8lRgxdZxY+FQu0wU3Swr5QQrRZDVb2UIkxIDAoul7Hi8j0NyeqEuqH6
	tR8aY1W1/ABTmw2rwjktPaydwGHAjBK/GX6/Il8SwNEnnytupguaq1fY2bWYQS10=
X-Gm-Gg: ASbGncsOQZRbj2EB+5Q6wPazpDMJnY9eo0tRpzaOVRHurgcEIfRzjOwiKozbcIATC3b
	X9zebdqcWNqrFnaoAJLEq0Xa8CLLZCXrgMdcz79fkOi/bDPdrhQwG3G8Cf45OCRj2Nxc7vG/6rs
	Sk5+gp+nrcdnnRIvVFH8q+EuGwEDhtvh9tqwmvbHSDTOlZ6UNS2p2VzZGmPpZSPh0X0H6Cf97yx
	rArtJtUiDbwfISNljT/gCPwSbwvKAmNAnwC+JtV6OfVFKsCfqwZByZHU0q2ytCVW30kQ7iv7SX9
	1yg3iftT5rFGKCVPWI9RSj5dFF6W4ICf+U/Mi4XP4cjDsaGQ8cA2zp9Jj3vBLwMxD00OzCkE5Jy
	sPQ926rTiSbemsgBm8EyStyOvD7T9LEI+drw=
X-Received: by 2002:a05:6214:d02:b0:6fa:ce35:1ab4 with SMTP id 6a1803df08f44-6fb477360a6mr127107556d6.5.1750071369121;
        Mon, 16 Jun 2025 03:56:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0tHyfSO20KsJ1oLF/VLAlxRq0DyfZsdIbILabYQwWhYIMJWrC4YMJSsR6p+o59/1pzKU9yQ==
X-Received: by 2002:a05:6214:d02:b0:6fa:ce35:1ab4 with SMTP id 6a1803df08f44-6fb477360a6mr127107306d6.5.1750071368743;
        Mon, 16 Jun 2025 03:56:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac14260csm1492189e87.86.2025.06.16.03.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 03:56:07 -0700 (PDT)
Date: Mon, 16 Jun 2025 13:56:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Rob Clark <robin.clark@oss.qualcomm.com>
Subject: Re: [GIT PULL] qcom: GPU firmwares for X1P42100 chipset
Message-ID: <bwgnaeh2ozuqmkmognsvnpumqdprlr6rmcbvyd2dezglgna534@qftt6iydraol>
References: <e036373e-0356-4fa1-b39b-78eaf02179d6@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e036373e-0356-4fa1-b39b-78eaf02179d6@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA2NyBTYWx0ZWRfX6h5zCw5PXIGH
 s9GDJAVIYqUYmOMfnZP0Vcdxjd4GUEP6XsC6dyjCiaMNMscovHx02DHvNQdnfl778oiLkK7JR39
 64i7pw9/QWzqVRuEilVrk3cZgFTMPjiWt/Zf2GGVCW6BOJSy839LuA0nQULiRl/d/4torhlkH4U
 Ng3x7a0ABFu9acUgFQ+0U93LgtA9ywe2RTFtnFkwKHy3cWBlcK9kFQ2+G6IvvsshI1CX7+/dINt
 88YPHrRbD2Vh9sL/YAA/bIIIHWwPaGKSN6KZ2um9rD7dOqi0I9jjeUYNgG8fX+x9Lx9ELRydZR7
 QO3wHwnv7FbGfxd6ulH1//b6tT6qoSGHSanO4X/eCLRvjsVAIeAF/dMQHZp27fnQaQsHg6h+8b3
 w+njU8Q47Do+nj0+NpDHIcoilU2VlglB6uPZui/29rLsYe03hl+v0DH6AjX986oJP751ks2e
X-Authority-Analysis: v=2.4 cv=VvEjA/2n c=1 sm=1 tr=0 ts=684ff84a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8 a=kuZZwv549i_sT3CySDQA:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: q-fJITvjxC1bNzsw814uvfichAUCaM8D
X-Proofpoint-ORIG-GUID: q-fJITvjxC1bNzsw814uvfichAUCaM8D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_04,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=730
 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160067

On Mon, Jun 16, 2025 at 10:34:06AM +0530, Akhil P Oommen wrote:
> Hi,
> 
> Please pull the gpu firmwares required for Qualcomm's X1P42100 series chipset.
> 
> -Akhil
> 
> ---
> The following changes since commit 12fe085fa4096dedd82a9af0901fb8721379011f:
> 
>   Merge branch 'qca-btfw' into 'main' (2025-06-13 12:32:39 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git gpu-fw-x1p
> 
> for you to fetch changes up to 4cb2b59c30c23fdda8c4b00f00397fb7b4992758:
> 
>   qcom: add gpu firmwares for X1P42100 chipset (2025-06-16 10:14:53 +0530)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
