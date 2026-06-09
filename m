Return-Path: <SRS0=kxTT=EF=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A3D4CD8CA8
	for <linux-firmware@archiver.kernel.org>; Tue,  9 Jun 2026 09:18:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 78CB71F0089A; Tue,  9 Jun 2026 09:18:42 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1780996722;
	b=TkrJqQT657zVgBoZsb+94azNRyf19QblA02Uv9TIHM5NLTbuInyTXjC8yms93tlOUCp0
	 B/t9qFhOy6GJ5h6sLAKM/LW+d9l6A5eZUlgqWwHgQW7ohkBJtWUT33nFzUTFV4K23ZPV5
	 1p+AWL3dLvKXbvX7VdJ3srGmTexRs9XfGaN6/59HzggQFaJ+mGmYVVwAtACvwDvu63ISf
	 qu7NpQV8FnMJ1Q55yLwZg8/zgSRd3Sbhs89gT1qLG9BhzAu2OA/4g0UuFjzqEN2f2MR1Z
	 jMtN8A3wBOt8aDDifbZL7VhQtZCub8f7+3PhvwizW0PaYGBDk9t1RHU8hN/ZaCXnHww==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1780996722;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rpHJkqr6eRf/QmZnEQAm4LIQBldHCyum5GO2tyHkJoc=;
	b=wmQ2oo44t5q0Zd4Ryvb+2riM6DkUASeUrXDj9sOpuqZaSVAIHqQDGvb49qZlLhCZZhFh
	 YVkcaeXJ6FDFLcF35OoVkB/JoVz7saTqYhzq12fO/v3mGAgOU0+rz+WPt+LqSbisU8y0G
	 rus5MAAxBVqgPrscVdWgFwvxnMdT24fEu0UZMr8VDEAMqdvlgECHDIbnOvlddyeJgTddb
	 nPpzCijsFHv8sLhV4+iYc5JR+OBrgV6dstxmtZ6INPiHgpjAZDqhGlS/cllYgeN5olOgs
	 g80E5/fbhn6xLdjS5YFXiPlOJKmR6dEkAzRcq90MKd+CCSL21LE2IdowcUkOvRQOWyQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="bng7/kAV";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ke8YB14w;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C01201F00899
	for <linux-firmware@kernel.org>; Tue,  9 Jun 2026 09:18:41 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bng7/kAV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ke8YB14w
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org C01201F00899
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597s7iJ2001869
	for <linux-firmware@kernel.org>; Tue, 9 Jun 2026 09:18:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rpHJkqr6eRf/QmZnEQAm4LIQ
	BldHCyum5GO2tyHkJoc=; b=bng7/kAVdoHq9nByZ2UtfRpqsJjrEb2wmTiLgIYD
	nyyTAaq7DtXo2yi4Fzzy73YToO+sNxn2B3fOQBojtiXBXf3lVTn/3aNJwti9FN5O
	3/0wA17eSINE1oY4Tbp/5jkF8gNUQpPig1O1u+S4oTBW5IQhLg0wBXL4L4El8gbo
	BGPMm/M8rSGftRolksuwdPMCIQGEtGHYdqg9VpcJu2kZ9e/tYz5sl2wsNewR2i0a
	ZphiCZOWv33s6RmHPYSao4HnPelh0NgTZBotW+AdWwLnV80RUlPOOmZABtKGpKq9
	GG4YcfIibG4PleTHPWZHpjej6d2FYhG+in1jQIOhdLfRYw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epe25rj7s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 09 Jun 2026 09:18:40 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5176d5d7222so102967061cf.0
        for <linux-firmware@kernel.org>; Tue, 09 Jun 2026 02:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780996720; x=1781601520; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rpHJkqr6eRf/QmZnEQAm4LIQBldHCyum5GO2tyHkJoc=;
        b=ke8YB14wQqxwLTMU215DJzNPLxcPK1xKyciApI84iT5cP1rVnGbjRzwu5XimlRglJP
         kwMSmaE+DMwEU0JhFaZMuzDeCVAdacw8AMEPKTUYCFnLaCZxW/KdX/MegyXDElbJpEUg
         bgIGtcB+qSxMdy4gN+h0vydoRNaBDWsIIjwqV7zsfvsPXsRz3OM/BYw/hwt4fbNLWrJR
         1dJ8JvDPDQxWEpDbXAO2FZnsunvrX3tz//BmA2Phu8w36osu0CNKT0j00atg24F0Iazu
         xMHb+W3gr8nCn1I9YH28CmVUOOI0CAy8l0T4rL/2ZygECC7OI+JKSl63e89niaCSrzgn
         Kp7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780996720; x=1781601520;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rpHJkqr6eRf/QmZnEQAm4LIQBldHCyum5GO2tyHkJoc=;
        b=d22Uj9hzkrWIh8vydM1lTA4nVXg+bQu+WgE6UOVXGlj73zzT5TqJZtECJaJrLqj8pd
         XVrgXoUmgrw4oE8iJYvVJAjf+Pi9EZjCdxZtVDKxn4vN0F+ZOrUtrpUGV2LpWQAjGZFR
         2gy6OwpgS4LqkT9i/hu2NGhkX61C3A8eTd7OOv880OJbaa3JVEy87DIMczbviAH24aWL
         xBjD8ZnGhTNAoop13jZU6/4y5z+aBH/EbflwwP7Aj3A2WjrsdzO+DyoozgqbqNfhPFwt
         9eytUfe44qOJFuEvbIY1WZmSw3ldg5tJanuf0WlkMmfH1T5LXeqengWtFww5VLVM3H6k
         sRTA==
X-Gm-Message-State: AOJu0YwTUYyp+AbhfBcWtwbsLRjNZcFU2wYCTUWMFfbO/Ll5BkrD0UCh
	ygmkwNGla9+odOwxmC4M8jRCwqI8HjO9V7X/imdKO8b2hoFa+QvkjNqUDMw0TPA/fTeUvgp2i7h
	oEvB81JtF3DoZZRd4EerIMs4BO08e77hFvH6gsSfakdCtmM99/tHRGTmp6fFQkQD0kyr0OfLr+g
	==
X-Gm-Gg: Acq92OEJYvrQ8epyz/yGdRBUdwFHo3KWNHEztR+DZ3aQJQzWPWCjsYmAfq68M9atsYW
	Rbdyf0ZuNIkLglYPw9gHAgPK+qIcxbOQCoOt/iO2oOHjdPQhaC3o/Kb2g1KYBHCycVAtSXe6enO
	LPP8Bb+v6Kq/rjEV3bGOu4kZfXKdyzh/U3JmCZyMMLmlGBm/QQwZC1Vuggi68q8D2aOPNNRrE8E
	R2dChstjkNLdNkaCLbeZOtTgWrI7MMQTS1uU6hQl58zcCP9sJHrQS7bOFMckhiEzJObpkfECc3K
	UO7ieg1zcPpD4CuT8Ne6JaMBCOzY1ANSBj5NS/BRZw21i2vh7Ip8AxgGTvfdTZ3yzAlRZwCCpdX
	y69reRW44X3+wVe7B5cwR3XaBorwWVCok5x9w7OwZMtyFXZuPf/hkr6620uGdiwswAqEcrr9kzu
	UM6fxUkSSzy2DTIFROVxfp668XhutiyhLD83NZZTTyVaR7tg==
X-Received: by 2002:a05:622a:987:b0:50e:60a0:acb4 with SMTP id d75a77b69052e-517ca5fb159mr21869701cf.44.1780996720073;
        Tue, 09 Jun 2026 02:18:40 -0700 (PDT)
X-Received: by 2002:a05:622a:987:b0:50e:60a0:acb4 with SMTP id d75a77b69052e-517ca5fb159mr21869551cf.44.1780996719631;
        Tue, 09 Jun 2026 02:18:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2ed9eesm53248871fa.40.2026.06.09.02.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:18:38 -0700 (PDT)
Date: Tue, 9 Jun 2026 12:18:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Subject: Re: qcom: update ADSP firmware for sm8750 platform
Message-ID: <htbjbpblsnu3rlfkvyyughtg4lrinzy44tsmmqoh3jxutd5wyf@23cc325yzjek>
References: <438318b4-68ba-47a9-8d44-a3af14376956@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <438318b4-68ba-47a9-8d44-a3af14376956@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: -hdnXtPpfSmKVzrJElTTsq8mGx4-Ow8f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA4NiBTYWx0ZWRfX/cgrRAZo17SZ
 X/7Fii9ZsMD7YBvcG7fz7CCI8X02qENc8b2HfFSmHtDsP1sUiEvIgmRBGHsZzKjrDIjzbVX0sJ+
 Ehi6Y2Q379ugvno18oJO1tRXy/atJKEyCYvT2Cn0ajJe+PUdCG7S0TLKxCl57YdMHWfRXFQxRAV
 pqtdkCLEvFM4Hue6HB7lS2MlCbkJik+wPJBEliLydGJfOIpRD7fPkyyxlrwLcZZ0Nj4EbC+3MMg
 Kd6/ql7XcIFUZq5vXoZD5ksvYBgaWPkUDo6nP3Q4z97W767U05L2vct8U/mRHRLxdwkeVtSm6UD
 s4XFsN73mDkPa4bYskNol3wSgDZQWxm/7qJTAwL2cat5Lc1/zYQmEyTpV/Pl97/Sz/GZC3Dl7JT
 jllx7Pq+FrGKgQHqz3p62Tq5FQOOYWtm0xnXEe1RQp2S9vEV8khHrZ1Fw2bhLa7CaKrIw8SAusr
 ZtqIs/LJQRJvYEKNtCA==
X-Proofpoint-GUID: -hdnXtPpfSmKVzrJElTTsq8mGx4-Ow8f
X-Authority-Analysis: v=2.4 cv=LoqiDHdc c=1 sm=1 tr=0 ts=6a27da70 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=qC_FGOx9AAAA:8
 a=p0WdMEafAAAA:8 a=IZc_VgG_4lyaQFf2Al8A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090086

On Tue, Jun 09, 2026 at 11:03:04AM +0530, Venkata Kota wrote:
> The following changes since commit 4ae4d61bcb180be5a9dc6a0490885b9a70c8812f:
> 
>   Merge branch 'wcn6856-fw-update-00669' into 'main' (2026-06-08 10:47:22
> +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dspfw-qli-pakala
> 
> for you to fetch changes up to 72a012ee810d6a6ca4f29e13c1c300f6f364ab3a:
> 
>   qcom: update ADSP firmware for sm8750 platform (2026-06-09 10:58:59 +0530)

Thanks, merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1088

> 
> ----------------------------------------------------------------
> Venkata Kota (1):
>       qcom: update ADSP firmware for sm8750 platform
> 
>  WHENCE                   |   2 +-
>  qcom/sm8750/adsp.mbn     | Bin 17639864 -> 17680824 bytes
>  qcom/sm8750/adsp_dtb.mbn | Bin 167736 -> 167736 bytes
>  3 files changed, 1 insertion(+), 1 deletion(-)

-- 
With best wishes
Dmitry
