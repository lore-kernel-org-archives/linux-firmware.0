Return-Path: <SRS0=UU7q=7N=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE93D1489F
	for <linux-firmware@archiver.kernel.org>; Thu,  8 Jan 2026 06:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AC4F2C116D0; Thu,  8 Jan 2026 06:00:28 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DE969C116C6
	for <linux-firmware@kernel.org>; Thu,  8 Jan 2026 06:00:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DE969C116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607JgoMv3152713
	for <linux-firmware@kernel.org>; Thu, 8 Jan 2026 06:00:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aEjw0bwaJpOIMd+hyzWIWzTl
	9DkhVqovYknOjuh4XUA=; b=gbnUJbxilq8RLg3F/ydW0i4Z8ombk9272O2E+sjr
	7iNOywkW9O2kzPdpjFb/wq/wXfAsvOaViuo9D/sxWhBm0hGG7tjHYaR3BvDlaPfN
	AVS3tmIGm/ksDGuk5fxD7erjXuS7IQ/DeGmo5mrk0NrSljm73uXA5NTMHdGhsiWr
	tvObdJuV9w/H2OhhSUUINdvQujuxFoZEeGP8f7rH0DG6GysSZHdoaW2kpB9layPF
	Gw7Tgl8qVwt7IDCOU5RT48BzvAacB8dMtKiM8WEpa1plwy4V4cWT64NsbOMtXs5U
	2cBcOru8gA96d45YGtHtf1k8RNS+eFBIEnIbhghOKVJvJg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhpjau6da-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 08 Jan 2026 06:00:26 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88a47331c39so72449326d6.2
        for <linux-firmware@kernel.org>; Wed, 07 Jan 2026 22:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767852025; x=1768456825; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aEjw0bwaJpOIMd+hyzWIWzTl9DkhVqovYknOjuh4XUA=;
        b=JmL/5dkMS369xj9/hLulp2OCfluDXqVOoUtowDYBYPtm5BcFqB4v64o6idO1fcGsbf
         69DaU/zr6sNvkXXOZ3zGyaHsxmDs1epqUhT5Mmy/u+pEQKPYw5OWrZOal1Qn8BMx8XAd
         x3bU72qxF7C1ot04qPRq6Q56Q41OSOq1B8Fl+0IClJ9PNXZU6zf5ZvdtVv27pZbkIATE
         +0UezP/wLHKS7PwJ24Yushg8R/B2MUbT9mBGgaD3nljVsIstLk+h123kXaQtsjSyPH/s
         4+CClpF9FkXk4G0SRWTpOhN6oCGh/5cuYUmOy0bTs9hetpeoVOnAfaAlWbX3GI8xNvGE
         zFMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767852025; x=1768456825;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aEjw0bwaJpOIMd+hyzWIWzTl9DkhVqovYknOjuh4XUA=;
        b=F5BTur8SKzAh9eNOLip6iLz3KQtZfIi6O1/rHEH2oOGNc/HhUhulNmnDlE+H95mNhw
         JORMeTPN6Ejg2nislpBREfK/aHm5CfqSBVDC8y6UM03Ju4dhtI+LLD5QljBbXdWSZanS
         RyIj03dcMwnV39VlB/3HSDzhwC/2M6U9EFy5/oRmGYmY0vz8hjXQDfw4+DgM53dyrDnc
         j2h8fxjUxytpulCkNAo1x138py1sHOZNGrfJt57LOQTMb/NCyTzC96Q+GluewlesFC2b
         B/jTJlCzsKsCxgSCW8sy6Pa0laBTEL9zv20oUIqDrzryHI1ejHzhhtfbXr9uyeGavdWR
         aeqA==
X-Gm-Message-State: AOJu0Yyuc6ICxefvITSjVu3nms0p6IZ8PK/q/EpvjVLhYu1YRtNjB444
	VDQdsGj6RH/9SrVJXztO12q96/KkW/4BszD/WHnfBBaiT/rsAx0zlsmfwDKZHVb6HR5RmcYxNww
	zattx5lu4V6ZnWj7qc5do2zTZfkk0lBkWLlYFKjUn8puAMPsEVqZs+xZ0FMN/QW2/1Y6LCo8=
X-Gm-Gg: AY/fxX4JQifvzNhJcHhgp5mZzkZfGAOoiI/UUwyD2Kjo8icQKsRozxv6JFQNp7sX8/V
	CHC66j8gcqc22YJTSBvDihtwHsUsIthU8DRH4NgHgDYlWsgRas7w+W29hawvdqc60CvMzE2JPut
	pe3VhMdMOPvZaM1FHfX4v1wz3JbSdtnfxn+XjFXHa0drOwXMUnbhWxf+82WyTJLeRlWGf69q4TZ
	jAEN6YXQ9+a8PR3/YF/R66wF28pSL0r8hW5VGHpQ66Byq77A6ePp1XmgcpVTfz31iKZ9YQ/Ljir
	69xI84vpwJjooPy+hpdDImGD8ct+EGAwyvkrG+dCBW0VokqfuJ/J787L9UuY6uPpnsAa6r4h834
	9hTzB4enJXGffXBD0qXJbF8W0CJBWqt3ntGH3m9BVZfmJIgxwxzNohTmcEduoPXHCeCJ1qeuq6b
	Xcy2UaczKhpfopclWQLIxhIKQ=
X-Received: by 2002:a05:6214:2e4a:b0:87c:22f9:dac4 with SMTP id 6a1803df08f44-89084207317mr62016116d6.15.1767852025175;
        Wed, 07 Jan 2026 22:00:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGD3F0sQjxV4re5knkTenJhoa1O0P4duc5kEez6ueJBJJ3Xa3MpNbxuT98EcSPVGk7fZZkVZA==
X-Received: by 2002:a05:6214:2e4a:b0:87c:22f9:dac4 with SMTP id 6a1803df08f44-89084207317mr62015576d6.15.1767852024589;
        Wed, 07 Jan 2026 22:00:24 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b715ebf53sm876900e87.76.2026.01.07.22.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 22:00:23 -0800 (PST)
Date: Thu, 8 Jan 2026 08:00:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, psaddam@qti.qualcomm.com
Subject: Re: qcom: Update DSP firmware for qcs8300 platform
Message-ID: <fgnnquqncrkkeza3ch2tafondp6oc3zuf7fv6huljdvdxu5pxv@7ttzf5ixty4j>
References: <f4655e94-b451-4dce-8b25-e27b6749d9d8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f4655e94-b451-4dce-8b25-e27b6749d9d8@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=efMwvrEH c=1 sm=1 tr=0 ts=695f47fb cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=qC_FGOx9AAAA:8 a=TfXf4dGFETUQpLLpI14A:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: Xco7xIUsD02Pic7dxUKyqq7fT2wxsqMw
X-Proofpoint-GUID: Xco7xIUsD02Pic7dxUKyqq7fT2wxsqMw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDAzNSBTYWx0ZWRfX2vrfZ2GbzMtx
 aQOFH/+pM0BGnPFlzVo/0qq2aghpOnRgtOhVxPsLsKaNZvoHi/njkdiCxHUWsEViBk10v0nzrMj
 kMIycWByFCfBVBsTr99p8vbOBjygIQEQ7oEfuuTBsgUgUN4I4PH+ZNntQhbs70SsdZo6X4+C19r
 g8UjInSq5XXo48cGIOd4PC+54dttaMlzugjPl2A3VLtRivxJ1bZXsxkdG0r5XaGWI2Idy8M+1vL
 rAzsBm6kmR15JetpPf47oZeizQJCTwONGYMd2/KmIRvrGKOYYbi9GVR6oU8/XBuT2Wy4RAUkKQu
 zSI9huFFgXnxO722n4xkTtdnBMMcVV1WQgnWEGQZWlCx0NkkIMa5TmfF9Ar1xnCNRod/QEmasld
 Q24GJmWJYKL8Y1p6CzDPhgiqbOaYoFGRRjAwZrDeVLnIZ89OCmyU9nxG1wgqMU3ef/8Z2LOtJMP
 fAA0dGCfLL0tVz5Bw9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_01,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 adultscore=0 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080035

On Thu, Jan 08, 2026 at 10:06:46AM +0530, Venkata Kota wrote:
> The following changes since commit e272e0d1edce58496c3917f7422b9531daeb0535:
> 
>   Merge branch 'robot/pr-0-1767725013' into 'main' (2026-01-06 19:05:06
> +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dspfw-qcs8300
> 
> for you to fetch changes up to 5ab272be8f8ea70c01587d8da51cde1ef40c5f86:
> 
>   qcom: Update DSP firmware for qcs8300 platform (2026-01-08 10:02:25 +0530)
> 
> ----------------------------------------------------------------
> Venkata Kota (1):
>       qcom: Update DSP firmware for qcs8300 platform
> 
>  WHENCE                  |   4 ++--
>  qcom/qcs8300/adsp.mbn   | Bin 6692864 -> 6791168 bytes
>  qcom/qcs8300/cdsp0.mbn  | Bin 3096576 -> 3170304 bytes
>  qcom/qcs8300/gpdsp0.mbn | Bin 5881856 -> 5984256 bytes

You are updating gpdsp0.mbn, but its version is not changed in the
WHENCE file.

>  4 files changed, 2 insertions(+), 2 deletions(-)

-- 
With best wishes
Dmitry
