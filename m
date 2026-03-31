Return-Path: <SRS0=8fEY=B7=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1484C109B477
	for <linux-firmware@archiver.kernel.org>; Tue, 31 Mar 2026 14:49:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C46CDC19424; Tue, 31 Mar 2026 14:49:30 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EEA58C19423
	for <linux-firmware@kernel.org>; Tue, 31 Mar 2026 14:49:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EEA58C19423
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VCvMYW1305650
	for <linux-firmware@kernel.org>; Tue, 31 Mar 2026 14:49:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BsJsviJ99b4EQ6RT3okdeuVo
	ofO7yHihiEVKI2gwRbM=; b=Y3LlF7do/+pL0dpCNwvZg7le6DvUHstjKeYzTz2X
	1PbvxBX4Zu3bh/amIOhBE0AxM4i5Jjto97vS5T6f3917mwYAJXc5k6mjc35mXO4N
	CF/fhZOTSN7m6uiDlkdn2/Jh2qbsCPduzJvHk4BKnObayK+mzcocSxnEPgxwQnyF
	3OsWeDYVAfqyHCa9OxZ8a/5TI9aVAj1x15i6Wtzr3Z7sl8sT4+JvDg+UYpvhdKG2
	WGbsYF+UbL9kakMgAGSx3G4qEWY1IEukXF3ms8ncq8GxNINhp//RNPOSEAzhMv0N
	V245HAUFDsVxKi0dvYdXbevsDdlSphkeg4x6qZn1xtD/FA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8equ8n9t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 31 Mar 2026 14:49:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50939597b85so148566461cf.2
        for <linux-firmware@kernel.org>; Tue, 31 Mar 2026 07:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774968568; x=1775573368; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BsJsviJ99b4EQ6RT3okdeuVoofO7yHihiEVKI2gwRbM=;
        b=SAc+YkUmcqMTKepSv9wP4qopxTvWuUXai66FfFIMwo9ze3brZj6RuwrmCxCGpb6il3
         hA5xk4LH5yGwjHSsDeSKj6shuVwQfxQTL9PU4Ilmx8rymgVCLlM4Nh5cqxLt+X79gT2u
         No5XveKpaSghcdC5DS5JIZwk9/QOtsAVBYlWh8/MBGlSrBkoAQIzcosAiyfWo7phTBfx
         ut7k73jG+wCpJwFvJN197oXyiYFVVkxxXo3W0UdVlq8aybiq33uUHsz5emCaio2nrYPW
         YM8phZ1Fnc3Ng0GD2tgnNrssbQglo8Fh+NrJ+g3PbqaqLgsnhPYHmQ1Y5zMrNIaUJWXM
         EuLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774968568; x=1775573368;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BsJsviJ99b4EQ6RT3okdeuVoofO7yHihiEVKI2gwRbM=;
        b=AI5332TZlmMk0W1K5mQc3FcwupekYP0jj8qZyUxbPhYKYgZqvcumPeCL2ixhdO7hWh
         Tp0jKFb7v+XisJH2ZMZo26thDXPTsBgj6SE3AtkhKo2xGBZe0I+SAKHDo6Jebv2K+jFs
         qee/oKj9O8urL1Vw8VgcjONzUXwV2nci5wXIaG4iAPZ6Nvl3k00LGzrvHLfcRYwTTxsu
         17ed1s12kC7aR0l+vFEH83nq4CTpUHrxLmiHlJVC0Dh3vdR0rG7km3hRSbTUHhhh7w8h
         bRe0Rd27vBQIJDTNZox9IP9ZVpJh3dxyw3Kps0DzTwwMdSOUoWMYm9Ue2iZqTf3fs/Ft
         86nA==
X-Gm-Message-State: AOJu0Yx8Tf9jxbopRYzvlUcbZ/zKNtnO4b0VLgwT02t9KtnVV3ohAw2A
	RfyjU+QpSMgTyZwIZqmUp6uFuYLqcIJHEQfTdhzQ8noBd39FZt6ul5mNKNYgC67fxPdQbjw+6Qf
	9BjI0FfkyBxbvqNL4bHJEr/enmvzhSSHGX0oE7M7FFp9VUuJlaDMbfrrE3cj/n9M=
X-Gm-Gg: ATEYQzwBRHO1FUUuizAdNhcFDR3MkBWEaZ1mbNPvroDVLPlsV5d4GkCp6lDC/pXctmv
	jRd7n1kYuX8RPCnsFUXs94yY8P9i+LqlZEnAQzJKBGl0H46R6438WfdN992nc5X5IHXkoMhUKsN
	g3td07RzTR779473MMd28Efo8OYla9gqUHZabSpXNZ+0WHi1rqwEsNe+Kw0LKklxkYar7/HFcXt
	HJ0xCnCmzbZJuuk06ySFtdNnMF5p3MfkIXTZtdoY70KKf3YE3u5KRRwB4PPWJ5+BVDNzqyg/aBp
	bD6x8XLnPaobsCjmBxEmlbLrAIqjg4uS/BfHnHHF8+s6ZscA9gs4F6V/a/J6KQxMvujQzKsDib/
	mGV8/QaOmYN2m7PGVgWn3V4cwQ3fdpm/kayAk6wmfXqS5RlROIA373nXnJyb5ygrLJ8Qhebh/jS
	ohaIRTTyD0bhnrxOKg9KkUDsfEWixma6z4o5Q=
X-Received: by 2002:a05:622a:2d0:b0:509:127d:ee06 with SMTP id d75a77b69052e-50ba398d782mr214841611cf.58.1774968567552;
        Tue, 31 Mar 2026 07:49:27 -0700 (PDT)
X-Received: by 2002:a05:622a:2d0:b0:509:127d:ee06 with SMTP id d75a77b69052e-50ba398d782mr214841281cf.58.1774968567044;
        Tue, 31 Mar 2026 07:49:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b145eff6sm2472004e87.76.2026.03.31.07.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 07:49:25 -0700 (PDT)
Date: Tue, 31 Mar 2026 17:49:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Saddam Patan <saddam.patan@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, venkata.kota@oss.qualcomm.com,
        kssb@qti.qualcomm.com
Subject: Re: qcom: update ADSP firmware for sm8750 platform
Message-ID: <cgn3jvjyutddglx46kvckd6frqkxvlnx3i6qrtzyr2jggqhuk7@tnfevwujk2zn>
References: <e115ca3c-33eb-41a5-95fb-42d5767d474e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e115ca3c-33eb-41a5-95fb-42d5767d474e@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE0NCBTYWx0ZWRfX2vLRdABGGiKM
 nX/hPZFlm3AvbVF7K6u06RMfDZoryRxPLcVlS3zDKV5XGxTXY7YywTMZB0wnX6Lf+wjYoWekktP
 EOJFqbw1xHF4o8uwlCEjribdr7vX5yWvVHjvY0tTYaUeB/T5OgumQAu0rQ/AkLPA8rl52nn7qn8
 w1OG11rew6uWmT+8x1enIdh6PMDpqogSPb1LQHoJSLQ5/2n/JrAgAxmjR32d+9IOkd2OrPFPgz9
 +mG0bt+eaF8Ex4+vypq9Buq/Dy1md7yZxUnJnjO1jkHHpuyL+wIURcgC2rvb7Uidx2ATAvzYr+3
 4B8T+suXX0xGW2ZD18Hny/HzhUUYrX11UfyuAkV2pZraQdsP1grcPHLqug77brSI1g66dB2cOw+
 0w+1fBqkqZk92w0nLAw3A7kKSP/4F7zY824wDMZG7IJ6L6GYaoIEFVQtE9eqKR2mEh5T3w9BE3F
 Gs32RfKzJDyZz+en3Kg==
X-Proofpoint-GUID: VSHfa-DZHaBfzfv8XJmp_BFmqkhwsXMx
X-Proofpoint-ORIG-GUID: VSHfa-DZHaBfzfv8XJmp_BFmqkhwsXMx
X-Authority-Analysis: v=2.4 cv=YMOSCBGx c=1 sm=1 tr=0 ts=69cbdef8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=qC_FGOx9AAAA:8
 a=T9PKp4fd49NprDZwbA8A:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_03,2026-03-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310144

On Tue, Mar 31, 2026 at 12:17:21PM +0530, Saddam Patan wrote:
> 
> The following changes since commit 85786b4413fdc486e3bc0f4f6cfedce7802ed041:
> 
>   Merge branch 'amd-staging' into 'main' (2026-03-27 17:22:24 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dsp-fw-pakala_adsp_18
> 
> for you to fetch changes up to 47fcef3409cea1043a33ae74ba1a98e55877eb09:
> 
>   qcom: update ADSP firmware for sm8750 platform (2026-03-31 12:12:45 +0530)
> 
> ----------------------------------------------------------------
> Saddam Patan (1):
>       qcom: update ADSP firmware for sm8750 platform

Why is the new version lower than the older one?

-Version: LPAIDSP.HT.1.2.c1-00450-PAKALA-2
+Version: LPAIDSP.HT.1.1.c3-00018-PAKALA-3

> 
>  WHENCE                   |   2 +-
>  qcom/sm8750/adsp.mbn     | Bin 19413384 -> 17639864 bytes
>  qcom/sm8750/adsp_dtb.mbn | Bin 180024 -> 167736 bytes
>  3 files changed, 1 insertion(+), 1 deletion(-)

-- 
With best wishes
Dmitry
