Return-Path: <SRS0=gdgd=4M=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D88CCAC5B0
	for <linux-firmware@archiver.kernel.org>; Fri,  3 Oct 2025 01:04:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 66E88C4CEFB; Fri,  3 Oct 2025 01:04:19 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8CC32C4CEFD
	for <linux-firmware@kernel.org>; Fri,  3 Oct 2025 01:04:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8CC32C4CEFD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 592MVQhq019768
	for <linux-firmware@kernel.org>; Fri, 3 Oct 2025 01:04:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JkSiQcLGeb7292CiHdTMSSa9kQxJ0n43LAw4Qy1c0d8=; b=Gqx+cuweIhYh7lp9
	o3ysVDnDg4RAoLdk27uEgt/XhXkwdzjlce7R/XTDWBlhEokKhdyeoHnxiMeCo168
	X6vtoEUQRo4gVxgDpcIjeVrD27UXdJyx6XQawzHKyJCEzL3shaqd5tmrUxOsvXHc
	0O2gSimLhuzYO54j0VJlfSZb2wzCQoLHBwgsdIAvHjA8MfHIc23jtVhOj3YtG8Mj
	WtO2tN57J7RyWeN7gjohxOQXbD5SWEH1TIBE/l8NlEbfIP6HGJws7tx7xWfvaBmb
	9xPlEs8G9JFiW8sOwknoeBLS9eftuWMWuMBvb2lnRxkqa5yGTPBqHR8q8veIoXVL
	WDvQ7A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49gyu1dpwm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 03 Oct 2025 01:04:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e5739a388bso23040311cf.2
        for <linux-firmware@kernel.org>; Thu, 02 Oct 2025 18:04:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759453452; x=1760058252;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JkSiQcLGeb7292CiHdTMSSa9kQxJ0n43LAw4Qy1c0d8=;
        b=gEwSyBH/nHRWznLXcgy0RSgaMW1Rfi+ufd/gpYECz/oJeOS01Lg6yt+VBIjQgSlzl0
         1ZCTlwTQNh7TgeONsnfyu9mf7wYLRKvDxLAytnn0cVJxte4vc0yci5IWN2a6ic/168RK
         zl+YTshYA+vpxmUkxqcUtrdU1aNBNLb94EXvsyLz7pkXl2ohJTTbYfEsS6cVmyXD4VXF
         CpbvHCMH5Bw58WGXzEfm8NPlfRAVyBkVYjcAiDBLmQ6V3Z10WPlVDkyoYHNQzcjSGAkz
         4+5lJLtbXIST24LmPsHeB3AkCBDdJ+bqfJMxA7f9ujymlXYWPZl+8WkxzCEyc43scut3
         Z5jw==
X-Forwarded-Encrypted: i=1; AJvYcCXhaz0Xuvq87NpNSGUi0RBxDJTLwTuJryaUJ0RkIOu6amWk/NaZQXAciUHiPmxr39hMENgIF9yY2ZpnKzn7xQ==@kernel.org
X-Gm-Message-State: AOJu0Yyw2Wwog++1KDQvZG+ofNt5Y1y6nidyW6+xGt5RROq5Gfbu014f
	/dk/s+XSl36c1aXMhRRXkavxCCSNiwlwV8Qw4CbzuRl0i6PR749HnGe39ss+bjmso8gC9Jg28mj
	UlrPPflzaVz+5QacI9CgOehkj9xr8P6MCl9dLRpWj++jHsn9ff8G657LCHzBDYfwhV2ULRgv5Hg
	==
X-Gm-Gg: ASbGncuIkU2LVj6HGww8Ih41VOJhEda4vtMBhzL9AYB83QGzX0iOP+YHlwZux8Qbwsn
	HjPsQHXvD6TImQnA3srOxjkBYS28ByXHL4hepXja/h8457ZixyJp+f4/83zkctaYy4r4xy42cC8
	goV0s+E7GUbjxHJ3Y6akDkRIVI+d75GLIM+pvW/K7yCJHMlcQ2wHdBNvtIS1WnbqGtcLDGzpiLN
	RDDaAxUtZX/yMHj49VLcXJdacqsyphHKhMEW/RbCNvyH+Pg/NrWgoXXYD11I2xJ6QSE/mz8sBqa
	IterNbyec+7ZNrlc3uc3zE4H7nAyuxYwIKNKvqzARn9m40uD3tiY+xKPl/1YW4s2NCwUG/n7wj2
	SW3VoNIqlv05Jn4x9wn8nCohUEle9K87FawL5nDEXQeeLYStzMF7Cx2CsPg==
X-Received: by 2002:a05:622a:588b:b0:4d5:d752:74e9 with SMTP id d75a77b69052e-4e576a44966mr21873641cf.4.1759453451479;
        Thu, 02 Oct 2025 18:04:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmYfDZ78F5Bdhi3o0z1zbSYG/vmwUliKVpe1MOKwXBOlncpGyOznqePbRGBRPG1i0PDgtxWg==
X-Received: by 2002:a05:622a:588b:b0:4d5:d752:74e9 with SMTP id d75a77b69052e-4e576a44966mr21873321cf.4.1759453450955;
        Thu, 02 Oct 2025 18:04:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-373ba4f9349sm10421651fa.60.2025.10.02.18.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 18:04:08 -0700 (PDT)
Date: Fri, 3 Oct 2025 04:04:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mario Limonciello <superm1@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Josh Boyer <jwboyer@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        linux-firmware@kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Subject: Re: add video firmware for Kaanapali
Message-ID: <63652ibwsm3v4aag7ytezbzruyz5322quuhe27at7y7ez56peo@7mpkqwmtf2jq>
References: <bbd5acf0-e985-1f55-052d-8d3ecf0aa910@oss.qualcomm.com>
 <e2wyi33p42lsq5f6ihuw54k5q6czbt2en5ocijswypjgw52dbg@wz6x2fojxvoa>
 <CA+5PVA6gN4M7gchGXPoswHmv7h0NiZ_n063r1GOGGVAujdDbKQ@mail.gmail.com>
 <e7f5f6ea-ebbd-4454-9adb-2df9e3e7630d@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e7f5f6ea-ebbd-4454-9adb-2df9e3e7630d@kernel.org>
X-Authority-Analysis: v=2.4 cv=RfGdyltv c=1 sm=1 tr=0 ts=68df210d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=qC_FGOx9AAAA:8 a=p0WdMEafAAAA:8 a=EUspDBNiAAAA:8
 a=i-GJ8O_hKYS0QK_FnjAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=fsdK_YakeE02zTmptMdW:22 a=HhbK4dLum7pmb74im6QT:22
 a=poXaRoVlC6wW9_mwW8W4:22 a=Z5ABNNGmrOfJ6cZ5bIyy:22 a=jd6J4Gguk5HxikPWLKER:22
X-Proofpoint-ORIG-GUID: RorVehSVgF7Jn-uHbby2BzE8UVFUZF7a
X-Proofpoint-GUID: RorVehSVgF7Jn-uHbby2BzE8UVFUZF7a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDAxMDA1OCBTYWx0ZWRfX08xv3Jbnfe3U
 sJyNhbSXUcCbCNq8wmlpjzoKAkpuF0F8Etq9BiOKJtd/itQHZMh8kuS4g/IFvpFhtNeY6jUowU6
 3w9UwRdo+pJNafni5H6+Mjec8xtqPLTT4WQ8VFtfUuug2t2nOPvbtlEdMggY0mABx+0WWjAKxYs
 0zvmzSeQjq4AaHx1T2FhT8Yq1pbO2K30qCPFdQJZ8AGvnsUC/XaAhHFfnMPN/hN2Mqpihc11RJk
 3fOztQADWIkVmoGd+RGSEIciuLr2v42vTTKfwFXBU6S5QHTKhGK/YcEF+pmr+Rg0e70LEUOjI2V
 /E9H3puGUm50JaWjeHkvf8HkwuiB5Ig1g3g7cJPLSu6wKL6lKLYPVtaM4/rADRdE04Hm1XoZbnY
 EXiNgNAJj1mBbcWToFcjBMnfIdv3Ww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_09,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510010058

On Thu, Oct 02, 2025 at 08:29:47AM -0500, Mario Limonciello wrote:
> On 10/2/25 7:19 AM, Josh Boyer wrote:
> > On Wed, Oct 1, 2025 at 8:48 PM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > 
> > > On Wed, Oct 01, 2025 at 06:36:11PM +0530, Dikshita Agarwal wrote:
> > > > Hi,
> > > > 
> > > > The following changes since commit ed924f6db3c973f941fd6c6317c0d52664e83e5a:
> > > > 
> > > >    Merge branch 'robot/pr-0-1759253351' into 'main' (2025-09-30 17:36:46 +0000)
> > > > 
> > > > are available in the Git repository at:
> > > > 
> > > >    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> > > > video-fw-kaanapali
> > > > 
> > > > for you to fetch changes up to 7c2d4d41e96fdddfa360c0740e8a8ee9b5efb572:
> > > > 
> > > >    qcom: vpu: add video firmware for Kaanapali (2025-10-01 18:32:02 +0530)
> > > 
> > > +Link: qcom/vpu/vpu40_p2.mbn -> vpu40_p2_s7.mbn
> > > 
> > > Can we please drop that link? FWIW the driver for that platform is not
> > > yet merged.
> > 
> > This got merged yesterday.
> > 
> > https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/717
> > 
> > josh
> 
> Please send up a pull request to drop the link if it's not correct.

I'd let Dikshita respond and I'll send a patch if she or Vikash don't
object.

-- 
With best wishes
Dmitry
