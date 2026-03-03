Return-Path: <SRS0=M+PL=BD=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F20BEDEBF6
	for <linux-firmware@archiver.kernel.org>; Tue,  3 Mar 2026 20:52:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2DF9EC2BC87; Tue,  3 Mar 2026 20:52:38 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5168CC19425
	for <linux-firmware@kernel.org>; Tue,  3 Mar 2026 20:52:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5168CC19425
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 623H0kdJ087613
	for <linux-firmware@kernel.org>; Tue, 3 Mar 2026 20:52:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=i7BPlEdsGWoSAE+joA2rODxd
	Aot47pfvjW8xxncVgII=; b=HURWm22WC4XBJ/LOS8hr64AswiSeI4aHOKhWjfpg
	jNjLcV/JC8QIsCCIMkKcMfMHCEmsGhUZzpNY8eG4n5Qwmu9US7A/6Z3hXcrIi9W4
	N3Jk99CtNSYp8JSOGvA4jJG+7AF/zTYCBWrTGWSPnFYnTEkFW6PLvOqIWIZCH0tN
	zA5iccAqiU/McwBZMZwpBIn1SO9sMX4hmQTyH6Br91uLMi/tGLLtUKT4hTIVD8IG
	w3cqzOVpWUlDoGYUFH/4L6qtPY6kNvfgmqOY00rLm/6iMX7I7jf+f4iDQZA5RGXv
	I32+pFmDc6tiwkrnZWDd2tZ6YILqlMusrMAa3aBN1mYcFg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnhxsceyf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 03 Mar 2026 20:52:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70b6a5821so3374455885a.0
        for <linux-firmware@kernel.org>; Tue, 03 Mar 2026 12:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772571155; x=1773175955; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i7BPlEdsGWoSAE+joA2rODxdAot47pfvjW8xxncVgII=;
        b=AjTzA+67mn3HqCnUbTKA7TXUldmILEDHsiaQkE4jh6wFV0h8TYlFKJVYj2yHvObeDE
         BwqDs1zOtvwk3xDc2A6z9o5gyqxCnz5ynI2Ua5jv2GC7BFKWynx5ZFGk1PsGPqHkOuaH
         rSFuxo9MnM2sLKmEtUjULd+nZPOpJrl0K8Zb96nhdYQvmB0X7FzyiWlf/SI7YqLjIs4d
         F1Q9ym+l/GhKmAVqJ/8zB28K2866eGpwQSRXhsN3NNRonnHm11TvFbBLaoyfLae5I1T/
         Flw60VhiwWNRIhb4XMp45sHce3XwEnQbrsjS1N7ui2+6gshTZcop1C94S0vTPXCp/B2u
         fKPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772571155; x=1773175955;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i7BPlEdsGWoSAE+joA2rODxdAot47pfvjW8xxncVgII=;
        b=cn/sEKEH6iE005klwQLVOU85lG3yaI03UNX5JnJrNVuXCbELChD9gOHAz/V2foDg3V
         KvLCRvamNHUz69uawDvinzFo5eaTcS2C+dvVoA0aXuUfATocUxE7/MPiGX3gR9qbcWAg
         WJpX4kDF6tVRoPJwQpWDmuF1KK9MGtR9sw01rz7Ze8wmls9ml/GpQWM/pMdmTBS4KqGq
         thoI4litlEh7CqyYYVerfhRwF1G7fHq3SHqP8FCr3c5s/n7nj+8RDQA/pGVOA/IlW6bb
         srRTbnmGxJLZFoYqfr3nHss8eg+uTrYBEhl/9lnx6p7Gvs2+2hEANiIah8nZ5aj5GUDW
         pW5A==
X-Gm-Message-State: AOJu0YyBzz/rrb/0WPORYyvo7vjcasuHd6s3rflJ3nxB6C+YFxjRI9/L
	6h88YCAYLIgdGojpk/UyGCuo81uXl+1ACfaGoH81WzVY/0mWEWR9lurf+XCnuEBzeqZYSfrFf8P
	TUKwB+8L4jKDUWh3AEWALzZbfOzPSaGYC5M8hJYXjYGUOkeZy0Xa9GZvLdYAi2qA=
X-Gm-Gg: ATEYQzz5xbg2e2qqaJyYnlTkiixWwYqvZ1xBZHDFY/gHMX1l8iKwUSqqdIMjc/2rgC2
	+0+4QPxKdc6CBDWw3Kyj6PEkjnsndQim/dqz8cHkqLo9pewp0QLqHmVuCzfgczr8ylFfO2e3nO3
	mAV9nLcFQcv8vJZba3S7Qa7BEta6TSCyiBdEbFoeU3X6mxahcMByv36eZW51E4yaK/O/JdiWkkX
	cBlxv/CVu8v+dxROOoHoHnku4NM3jtsNZ7a0BZuhKmRso0mykP/dLneJJp3qlK+1s9Lw+KAMpyz
	tCmPoOay195+3JNIfE1QdgyI7hbyzytaFjcTxhC+nWygjTTSbhDgSyD94oB197ESOGhQo1qv97S
	AR9Ka7MoP47VySBo47P84wjQpaWJddjJfkqN9vmkE/TkLG/r7K4pvXa2sONBJZQ6FYrIdDXZ6AB
	lEHmCf/b6yVS2PfdBTUTTJVC2sBbIsKRtar6A=
X-Received: by 2002:a05:620a:7012:b0:8c6:ab77:f970 with SMTP id af79cd13be357-8cbc8de837emr2319937185a.41.1772571155112;
        Tue, 03 Mar 2026 12:52:35 -0800 (PST)
X-Received: by 2002:a05:620a:7012:b0:8c6:ab77:f970 with SMTP id af79cd13be357-8cbc8de837emr2319933985a.41.1772571154636;
        Tue, 03 Mar 2026 12:52:34 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f2f4b158sm33065031fa.6.2026.03.03.12.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 12:52:32 -0800 (PST)
Date: Tue, 3 Mar 2026 22:52:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Saddam Patan <saddam.patan@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, venkata.kota@oss.qualcomm.com,
        kssb@qti.qualcomm.com
Subject: Re: qcom: update ADSP, CDSP firmware for sm8750 platform
Message-ID: <armg3fzsmnp6ozmkqoq2uqfrkfepnstje2b3uouczgi52ugcky@jsqagqeotled>
References: <da2e02d1-8237-409c-9f9d-1dcf9d80ae1c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da2e02d1-8237-409c-9f9d-1dcf9d80ae1c@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: DaNxofnSCFN6F_2XgN-kefYlfXNAdDK8
X-Authority-Analysis: v=2.4 cv=dfmNHHXe c=1 sm=1 tr=0 ts=69a74a14 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=qC_FGOx9AAAA:8
 a=p0WdMEafAAAA:8 a=da8fxQNjThx34T4lXPAA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: DaNxofnSCFN6F_2XgN-kefYlfXNAdDK8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDE3MSBTYWx0ZWRfX4emk74Wtcg87
 S3O4JvpELCu5+jyIgBCcJkAqVaimp2PczWlpj74I1qeeI8GBl7aUXnDf2EJ8n9IfGiIsGH85zJ0
 jRLgCauK8KYMkFpK820XJ7sj1j4mXDGanuuTwexA//RpSqcM+caS86125kdRWIwdWuU2SDz5t3c
 +XKvTpmcsD2J4Yvhl9W/J6mUMbsp33G03NEGJqn2S8+kW7+ukfq4N8NwkVXDhJkWUj6Vmt6xpxq
 HfBiIwDG3S/w+YM5njBO3xhTCrZmMIWEtYHMK8GPV7J/B56FcQb36PNalJOq6lvCZT3Z/H5jPiA
 ya81BC/ag6+oC9JsiFbDEXeaMrQds0wHdpKYx8V5oAflprnoK5GWd8bv0TJqY7EV6rhrf90bvR9
 QqxBCKp1z3z5rcvpInrnk7auIEbaAVc7K/4Ponc2QviI2v59AV/FzHwhfiidGKLAWrF/zIELr7h
 J5RqK8ZwVhZFvxFiS+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-03_03,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030171

On Tue, Mar 03, 2026 at 09:24:53PM +0530, Saddam Patan wrote:
> The following changes since commit d8e138dd8970ffc9f5f879e2d62938abe6cd3f22:
> 
>   Merge branch 'bt-hsp' into 'main' (2026-02-26 14:52:51 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dsp-fw-sm8750_dsp
> 
> for you to fetch changes up to 58cb106f4dc72595c9104b69518bf5d87b76ba06:
> 
>   qcom: update ADSP, CDSP firmware for sm8750  platform (2026-03-03 16:38:03
> +0530)
> 
> ----------------------------------------------------------------
> Saddam Patan (1):
>       qcom: update ADSP, CDSP firmware for sm8750  platform

I'm sorry, I replied to the wrong message.

Merged and pushed out, thank you

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/943

> 
>  WHENCE                   |   4 ++--
>  qcom/sm8750/adsp.mbn     | Bin 19421576 -> 19413384 bytes
>  qcom/sm8750/adsp_dtb.mbn | Bin 180024 -> 180024 bytes
>  qcom/sm8750/cdsp.mbn     | Bin 3912104 -> 3920296 bytes
>  qcom/sm8750/cdsp_dtb.mbn | Bin 36664 -> 36664 bytes
>  5 files changed, 2 insertions(+), 2 deletions(-)

-- 
With best wishes
Dmitry
