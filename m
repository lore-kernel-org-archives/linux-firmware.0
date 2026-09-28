Return-Path: <SRS0=9+rt=HU=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 788F2CA5FA2
	for <linux-firmware@archiver.kernel.org>; Mon, 28 Sep 2026 11:51:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 52E811F00898; Mon, 28 Sep 2026 11:51:12 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1790596272;
	b=yvIhRsMltYDTW38u1x+EQZ/y0SYyezxs1+7PXMPi3Jqnfa/XkuoYis5fPfAy+Itt42EA
	 plGTlWJ6QtSENpAMyEaYBHnetGxLbIbZA3w+KpIwQ3TBBLqIzOSVdfhUVtVQ3HPPbOMLk
	 bF8s8iYjNAXBt5kJpx9cs0q9eLCRkS7a5hSZsa9IjSQdihsxw7H3d8LlHmPBP20SAGcCY
	 m39YBpC9cRqrLINmgdsJFxKgP5XvYRiUaXbxDNj/rD0M2sVAbXB9PO7onnZQHnOdTzx4r
	 r/Jk8oB0KN7EueWyT6gsz4q4LDIbt3gXZK/KvgODKj/yFvYAwH9XVHDRePxL/S3mwnQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790596272;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=r/OB/ZXiXp/aKnBjJusLRg76U36t0Mqr9EMb+SlO/cU=;
	b=BXojpUmMuxeOSGACEFGkAqscED02OHISraJIx65ma4NjwCvx2jR4eLgBRnXFU7bZjgqe
	 PJzR5hVoYop6YOLJWM7F9K+UTiBJhT/EGexBQoUSrHR/5anpS79ptaTacty5dMmghlXC+
	 DmbuxDAPrVf6ahHkgKuIF/jkHTJxPKkc0h69YIgSOgA6LPe1VTYNabg+8bjN5kGAJ/gG8
	 ENTfK7OFhPWsu8oFjT6smj0078tA9RrHeWTP2bS926h7suvyCpcgUfzaau7H/UOjbSf89
	 OR2yvievhjIRMyeh6rFrczInj/PxzS24Zf9Kr81k+1Az6t1fto5oeOQew7NMwQbbFOw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=emKx1d2D;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CBF10Liy;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8862D1F000FF
	for <linux-firmware@kernel.org>; Mon, 28 Sep 2026 11:51:11 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=emKx1d2D;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CBF10Liy
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 8862D1F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBABPn1682790
	for <linux-firmware@kernel.org>; Mon, 28 Sep 2026 11:51:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=r/OB/ZXiXp/aKnBjJusLRg76
	U36t0Mqr9EMb+SlO/cU=; b=emKx1d2DJ4ms/HQoF5ktgjIhrfbnEU9di+fnYaUe
	H8GCcyxh9ebUMi3lJwyhS1p5l+WNYx+oiVrTaHcetoagfGzE2StRejZxzsjsz7pV
	pLLJ/iGiGF2hPcOIdOa2MJ0LZvL8ikdY+oDSdf2WkL48aQyq89AHsMgY/71GSRtn
	7fAIDvpYgYESiME9aFfgHWwpW4GFf9LKk+SWSuxdCkS4skylU2YAnjV7lqxmUrTI
	tdlCo1uFABt2T2N+6IdpWwTucsZuKnLSpF7hpVndGqT4l3p0Vyi9TNDSundtCajs
	UObdtKedoerjEIqYewDb6G0r2XXHzYdqIkOq1r+wt5K4Og==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynfkrgut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 28 Sep 2026 11:51:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a1de6d5c3so765340585a.3
        for <linux-firmware@kernel.org>; Mon, 28 Sep 2026 04:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790596269; x=1791201069; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r/OB/ZXiXp/aKnBjJusLRg76U36t0Mqr9EMb+SlO/cU=;
        b=CBF10LiyJ8bQdgX+LsuPfnl/fb2EXB3sZGNoZaicOk2jpywWwW0//RhoU3dzn+ZTiK
         QxF6+15Em+sZVJ3CSYF/8XEZWIp0SNqLlEdUxGP5BunQQDVGAqQwT+8mp7wY93QnyPXc
         byVzzsZ6eMYWC1af680vQ3/skiVJXuUkMxcdjFzeyYAIQWs3Rdy9vp66lPO+Sh/sOxx0
         +orGh5FOaYUjStyheAaQRccK383mezF4C+AeHC1ftYAaIoF1FTEcEDfUyCLAxOpavXIo
         08m18y7kqChw4Y1Tq92Wn/g1SQhgrpQkiimFxbhErJ8KNHey1BIMS2N+DuJaIyEXZ1Lz
         IPSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790596269; x=1791201069;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r/OB/ZXiXp/aKnBjJusLRg76U36t0Mqr9EMb+SlO/cU=;
        b=g8GCgfa/Ju2Vj+PSUODzd7iEWCf6tPQ7VaQBzCU/3bKqSw2zYAkpmW8tAYZqxccowG
         T5bb3F2IOBJIOAtVhJZ88JJOFlv5izBJqpo7El78wK+u5kYBAZPOlz2bpuaYNWMdYpD0
         IuuwZJkhu4XUPQY3KLVU1DzRY9AzBwjfKyqvXQODni8vDVCLBaEq+rgyk/H0+GSQlwvA
         z05Ley09S/xmSJMwQ5/L3AgtLiX+G2XlKOyxIifWE5S8IjQRVL+48qm6X5ASLbBFqz4W
         hIFwurXTAshhpqqBq/pK0hNCg7NMaeB6x6pfEuT3dtU+Gi7ySTsXsfZwU5ivxpW+Q0fg
         TuEw==
X-Gm-Message-State: AFuF++mnyP2uOIekoLjQ1vqkwvCwX52/g2iUUKj4XK1u5/aegCnkRNe/
	oNNxYoDtU9xEuTs+cw7JO+eCQPrciPOMKkQAJb9s/zVD0NimomGuWI3Z7f9UEAM2BHQRz6mtJ4H
	A7hBZPm2bdK0gGAB83/EEugxbLLijeAEcfWMwT7GArddHtk8LIM7lBN30Q/FPL+7O9oZUACA=
X-Gm-Gg: AYBFou2C2NSgCgZUhSN8/WOnFC/NzHktylh2m0dmR2ihnBBT5twi1MWBgxazSHCaDj8
	iUXtsW0b54Hp+FtPgtEi++rQs8XYF6ScvlGvtFXuEfzvkzb/hp1xapC0FqNyJ3t0gntgQAwespq
	r5HGjhYx/pIbUgi10XbPwPf3ECn38Gjks9L/K+MKbShv0A9QT2YR6pPM1cRvXJTbXSJplAcotu0
	teyIo5UFhLEAm/lptwYuFyAsslxcARbv77xVrBCr7pieajzTJ1PMwjdvPvEisOfTBLewdSYUxp1
	vUtPy56nQkdVclghHy0bWuNz9M5wBSJ/IaOHJdCK/RIkYkuwQ5MFpHCbVxnOiO60VHE0/5ebbcM
	qtyqXjsKcZmpeupamJNPVvF4AnADWMf1AsPOW8ls5FF+MOfVKFobN1kY2RkPRfLqOondc6HiMQ0
	YPsWjmq9fikZbX
X-Received: by 2002:a05:620a:6493:b0:936:77d7:55a4 with SMTP id af79cd13be357-93c43cfc87emr1987023885a.19.1790596269268;
        Mon, 28 Sep 2026 04:51:09 -0700 (PDT)
X-Received: by 2002:a05:620a:6493:b0:936:77d7:55a4 with SMTP id af79cd13be357-93c43cfc87emr1987019785a.19.1790596268725;
        Mon, 28 Sep 2026 04:51:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a64b3a228csm28843171fa.0.2026.09.28.04.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 04:51:07 -0700 (PDT)
Date: Mon, 28 Sep 2026 14:51:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Saddam Patan <saddam.patan@oss.qualcomm.com>
Subject: Re: Revert "qcom: update ADSP firmware for qcs615 platform"
Message-ID: <p65scrmutedeyecsfdezb62w4hbepel3cr7evgw5gybrpmmjpw@nn2hszcqd4kk>
References: <17812e6a-365a-445f-81ce-42d5bdc774d3@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17812e6a-365a-445f-81ce-42d5bdc774d3@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA0NyBTYWx0ZWRfXxQNLBQKDNCv5
 oRdWaoe3FOs2rNV/A0XhqDdP6n6bxOgbMX/hc6/xyhxOFQ96V3TMYn0qiIa9Dgobqgkkwl/XJJl
 QHvekI4FeCfYK4nKrxEdPoZIdBlW6hQ6DZry9Wo2GfuDVfX+qxlKfTKNBjxXTKf8g2yQXisgNpI
 Hzo5Dv5WG0r4bGP5H08KK0dkZ42qBUX/5osVBEVASzCaM4PXolXEmDlhPEFl2TjPXmPV5OBhXRh
 HiOq4ZfD3ENd+eFAPxINDNH97lMDAocpByNU8Q44JgEHMSqssODVd+R4dC58Ay3MSVBGy0QNpeF
 Q51yx0JqbQiUktI3NkJBSrlFS4g6aIqdlJ8llGVOtUpGt2SwtG3MnacZsEbnYXT0FRBUMaUDqzf
 71pkx6bsbAfqcEq/eViduceZU+4PMKOV0PqhU3DvPcszXh9GRZK+j2Exoi6iAkXYETSCUTkx9Sk
 Drpeay+6E4WPSzj5PkA==
X-Authority-Analysis: v=2.4 cv=e6aT2qp/ c=1 sm=1 tr=0 ts=6aba54ad cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=qC_FGOx9AAAA:8
 a=KFn69NnDrUeLY8sNHoUA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: SxGxvuIshE7vwGAtAC0GHMuPVP49AriO
X-Proofpoint-ORIG-GUID: SxGxvuIshE7vwGAtAC0GHMuPVP49AriO
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA0NyBTYWx0ZWRfX2DVu7/GU78Ty
 GpOS0g9bO8xQltPtXkt5D6O7ijRXWVraw4wD7ugZrlyVrBvUqFyNPWRWGR8C7PutwzF3FCLL+yi
 C2EMMwTzKcsW2ezan/XGsP3RHM2dzPs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280047

On Mon, Sep 28, 2026 at 09:22:57AM +0530, Venkata Kota wrote:
> The following changes since commit 9b858e5bb58d7bf1fc4d8818cb9100aed6d46f6a:
> 
>   Merge branch 'rubikpi3-adsp-00249.1' into 'main' (2026-09-26 12:42:39
> +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dspfw-qli-talos1
> 
> for you to fetch changes up to e4c6dd83f2578e6c4a53d09ecd165da0780fecec:
> 
>   Revert "qcom: update ADSP firmware for qcs615 platform" (2026-09-28
> 09:19:55 +0530)

Missing DCO tag. Also, we landed a set of binaries with the same set of
changes. Have you verified that it affects only QCS615?

> 
> ----------------------------------------------------------------
> Venkata Kota (1):
>       Revert "qcom: update ADSP firmware for qcs615 platform"
> 
>  WHENCE               |   2 +-
>  qcom/qcs615/adsp.mbn | Bin 8659084 -> 8532108 bytes
>  2 files changed, 1 insertion(+), 1 deletion(-)

-- 
With best wishes
Dmitry
