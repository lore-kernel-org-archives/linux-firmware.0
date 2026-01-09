Return-Path: <SRS0=be0w=7O=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF33D1A610
	for <linux-firmware@archiver.kernel.org>; Fri,  9 Jan 2026 12:47:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2FE13C16AAE; Fri,  9 Jan 2026 12:47:00 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3D017C4CEF1
	for <linux-firmware@kernel.org>; Fri,  9 Jan 2026 12:46:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3D017C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6099UfNk3324799
	for <linux-firmware@kernel.org>; Fri, 9 Jan 2026 12:46:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lbmtctHjRiijkNU2wQnMzpvW
	6cH9W5VnugDKHriaLuQ=; b=WLYTxetlvtiMdokdn7170LrnOyDogkvy2tXiulyR
	zlLROpfyElxKW1SZU5IjSj+Ak/2EpCOOnjUJBJ6ugkhwTMK0QUtx8zJ5zU2hGt54
	RYjCv6ysFRACzCWfuf1qlGzO4IIfe8NMclWd8D/4O2iUMaTP1xIHy+OXK4N0kTXZ
	SubZS2QrCdnbvYpvh57kp1ApBBMzUS72KYAr3VzRmof7yFgjl67f/e6cHFohG0tK
	mGAHl2dwjoNfrKwSSWtXIQKI01d7RC4thIvacdlLj9xiXwO9aFvGBW0jYcNIOrqe
	ST4+/xcyo0/Fb0oInjtCacyy7fz1g56LPalJwugvhmVmog==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjrd6htjc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 09 Jan 2026 12:46:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c38129a433so1041677085a.2
        for <linux-firmware@kernel.org>; Fri, 09 Jan 2026 04:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767962817; x=1768567617; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lbmtctHjRiijkNU2wQnMzpvW6cH9W5VnugDKHriaLuQ=;
        b=P9wFM+5hLdqujiDOSfy6WrNGG2Pz4qmo7hbZW31K0MOVp3vrW0AlHEtoOkSnmup8vY
         xNub+E9I9oh+4O8NGQE5d73o1n9U3uWvfwRcqEVMUJ57vDTlSfM/jC0W574eowtMRMQr
         7jEl+X2CWqlDs0cn6n4dssWaK+BvHvUGbkQiYui5r8U9AwQZhsFGTkKTshBkUyYI0Vew
         0kyO3oec0W4lY+ib2Qi42iEw1q0OmxGlHnn8laxc/B4zcey3fpZ2onR9j0/cB93sZ/3c
         ugbiXaIkKB+9eKpv25ptPf7No2waP+3YxRpyNkbiVIhVq04AXwPmj1E+tyyuPlso66JL
         3lxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767962817; x=1768567617;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lbmtctHjRiijkNU2wQnMzpvW6cH9W5VnugDKHriaLuQ=;
        b=R6hao7TRZXE48dSb+f2IshWt4FS7Sfqwri935TL8CrPw02BxXZkjcALyLls4vuae4Y
         kO1dcjZY4g9UdilH7EM8qURuXsYfzgRrg6xSZLdrRF4NrrtamlxqKdKBuo0QCUqiF8kI
         ZFudG+vn3xsizr53DUFWfa301OB5YsOjPZbUQGIg5N1WLEYdbxoCiP51HIDVT50LBIX2
         Dp7uYnpfJZuPfZzYLKJjct3TaXO2bB4dLgmopD19WO/GdutdUUqck5iR/hpDK+Y1bTqj
         SQve0YLSn7PLEwpvweqNiWpsyjHRt25ka3GSou9mKvrzO73sHXlpQwqsbgICiuJDZ/94
         Oipg==
X-Gm-Message-State: AOJu0Yy70qpM/+zYL05dwNUrVwFjX8zJOqpbv2oquNfjF3cdc/wey8Bl
	Oz8o9gGpcs1B4EfftpXjxPoYJnhDHeAZj8OSH1vQlmIgRcMWfRT7zvJQjaj9mLCZ65VazqhHIml
	YYuAPZtaYBltB+WSvV7myohgt3U2myrDM9V7yA48kWeb1gfOnno/ihWYPY+iDZM0=
X-Gm-Gg: AY/fxX7J5SDCtE6ZEwo5XR+mIE7mp5gr/pjpDBqZ7y86i0F6vrASZxjfNzD55u8EDXD
	M/Qjt/1VUH2TjwIcK2TY35FAFkGaMk8NPTRwCYKllP2VtGMiqR7+0E/m4vVmee2RP0l9g1yyZS2
	d9hrpJz7OxLd2UDGRjSdMlFiFynGacIa6XIijQCTwAnrhhXNNWd1a5MP3qxugZ6xhoS9Xfo2LFG
	m3zMaD5ZOrjd/fEx6oqmF/nkli505aejEdqStZVrQ1X685u7Jx9E9RyFJ2iCVDxq7JD8cc06E3M
	OBF6nm7uhCHl45SQrzWLSPfTbJk89OlzbJatxTVmkUw9O64jHlRGxkSueJ16dgbRJdIqIW/TYr0
	37ygE/Oi7CByjKkBrS9hxAIYbWtQXKK6zPs/TESXRUgBmFktYSHIuXVptfzJRRI60L4lnblGCW7
	avlCwt+y+D9PsLhLbwD3ZCHBs=
X-Received: by 2002:a05:620a:3191:b0:8b1:2853:673f with SMTP id af79cd13be357-8c389375d27mr1266752585a.15.1767962817079;
        Fri, 09 Jan 2026 04:46:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGt+m+SsYErQp1xS3XGsPVCslppFjOIOE2Ykm/qP0Qa4zBq2MUSfeMhXpKpBlGtliGPPy3GeQ==
X-Received: by 2002:a05:620a:3191:b0:8b1:2853:673f with SMTP id af79cd13be357-8c389375d27mr1266749685a.15.1767962816626;
        Fri, 09 Jan 2026 04:46:56 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb7a5c1dsm22509351fa.16.2026.01.09.04.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 04:46:55 -0800 (PST)
Date: Fri, 9 Jan 2026 14:46:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, psaddam@qti.qualcomm.com, kssb@qti.qualcomm.com
Subject: Re: qcom: Update DSP firmware for sa8775p platform
Message-ID: <6xohd66e3dg43o7eshzec2gp67ggzxcmpwiz2dmo2zvmrspe6p@t2nfhcurbi6j>
References: <62282860-1319-4d71-b917-51a51f37d75d@oss.qualcomm.com>
 <lommxush223zqhanhyewajaf3lrnaw2gp2sbtp2nsl7stlz2f5@y6eqahqtmlm7>
 <46938a22-9e10-424e-aeb8-c14726f96fcf@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46938a22-9e10-424e-aeb8-c14726f96fcf@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA5NCBTYWx0ZWRfX5pRoCLM+FNxm
 jYHgjqCYtwO22zl1NV00yS0EzLgUkJ04QBMStKJT5B7nk0XuNvmjmwABKgh2pK7meU1P02LPg4V
 gP/VaeCtowLTL/zAORL2xHsXvYZV1UoWadq3jtcmxoCj4Fx+VhkKYmgMAsMPjWGpQUUebhdlVTU
 o1C6sDG3YQg0ppaPcyJB7KbezkL2U6KmvkzzmTYeOpfXcqUtBct/4pYTc6NLbqfuPBWRLsBfTuE
 Rz0ry9pZ/5EcqZnAsCRfRTvFk325FELvbFY8K+NI1qFbgiH4IMzPSEOSJWgOeqvmq8HSf6jo64E
 tQeMq39WPeFUcqf+4xC/3zSbdGnW6RyBsJXbvIVUicgWicXqmoMGt6TevwfXftvkmu6w48oUWB7
 QoqHU+Mu4zJqnKjlONAlpP2ocCBkfBJH2IRjwX3yhGUflxYis0BXlhB9d7OQ5aW/sVOkSHTh/ER
 CNzZpKzFRgy0F9HLSUg==
X-Proofpoint-GUID: WpC6Uv3WA6xyTZBEKcXO0CfcdmN-Am5L
X-Proofpoint-ORIG-GUID: WpC6Uv3WA6xyTZBEKcXO0CfcdmN-Am5L
X-Authority-Analysis: v=2.4 cv=Xtf3+FF9 c=1 sm=1 tr=0 ts=6960f8c2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=qC_FGOx9AAAA:8 a=p0WdMEafAAAA:8 a=6zqc2sysTXoEUPVlC3wA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090094

On Fri, Jan 09, 2026 at 05:51:09PM +0530, Venkata Kota wrote:
> The following changes since commit 9e2418490ba10d9c5dd58fcb56702b687639b211:
> 
>   Merge branch 'intel/xe3p_lpd_dmc' into 'main' (2026-01-09 00:49:42 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dspfw-lemans
> 
> for you to fetch changes up to a5cdffa580e8e6e4a098f6a73b803946ee9f1df1:
> 
>   qcom: Update DSP firmware for sa8775 platform (2026-01-09 11:11:10 +0530)

Thanks, merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/851

> 
> ----------------------------------------------------------------
> Venkata Kota (1):
>       qcom: Update DSP firmware for sa8775 platform
> 

-- 
With best wishes
Dmitry
