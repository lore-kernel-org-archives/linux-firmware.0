Return-Path: <SRS0=c9Fm=XK=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53AD1C369AB
	for <linux-firmware@archiver.kernel.org>; Thu, 24 Apr 2025 14:22:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 18468C4CEE8; Thu, 24 Apr 2025 14:22:23 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E2FC9C4CEEC
	for <linux-firmware@kernel.org>; Thu, 24 Apr 2025 14:22:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E2FC9C4CEEC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OC3F7I018488
	for <linux-firmware@kernel.org>; Thu, 24 Apr 2025 14:22:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZuEOlsouE5qjhQIr/Y9xuHlf
	LdUC5VpYxBfqX444WZ4=; b=YsWem6Mc9uGx4FeDSTZ0MsbIoA5PSkBluG8JtXS2
	o+z6QqD0EMDjQ+o1vn/G8qz3x8I1Idz6xnWt1oY87JHZi1zvJbBwrMYd+lFmzEsd
	jFjNaUMLvy5dDA+NkXCvjTOqN5IoGVs1c8sVHq0JfWK7nLDdtSfYs42tj9jyJisL
	jEut13/cNZ2iqC4/pJXnKl/k+jj8peirsqhmA5p1GDLoRmK68hM2MmM2f8gCcPu4
	AhvyMqqLPR6SA3aphh/QfTKEf8Qy1aPB6zZrUwpENzJbLHMQn6KTqJfUeBKKex5u
	SPGlza/VExeLM3CHWZLl8/Sdz+StpMyS+DcVKSu8GM49rA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3nu67-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 24 Apr 2025 14:22:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5d608e6f5so275748085a.0
        for <linux-firmware@kernel.org>; Thu, 24 Apr 2025 07:22:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504539; x=1746109339;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZuEOlsouE5qjhQIr/Y9xuHlfLdUC5VpYxBfqX444WZ4=;
        b=jc3d9aGht1Z6krEZns28zztTxr9FBbC0TtpzFwKA1bBXxFk0y5ZEnj/ZQxMcDTJ51p
         jye+zgNtQBYVCsxKAIxBAKczvK+kZEoKL/Orp68qg/Hr8rJmHZaMxv9x+slk925YCOxu
         nrvzKqEI0xPROYWr2+tNrY5NQLhK8GzL/CGGX4S8b9E1Y2jkStAtUQD6lQZPf6+Xkc+b
         xLMMshLAaS4VkdToURE79LTjV4IH7tw2QUXs9iEq+bt5vJ4N850OV3MBNaCLognCKmvQ
         vODkc1M+WhIhMnMWieV6wrNGYYohwXd00vgR4L588Q5LBV4BtzmRuV6ZHqSleN/AJepv
         noew==
X-Forwarded-Encrypted: i=1; AJvYcCUaXWepYU784aapc36mkl3kP7hSBdKyTVEN5d6hXem3EMAOreQ6Cm0sR+BwQDYYmjIcx7wFbSxHCZ2BqPY3aQ==@kernel.org
X-Gm-Message-State: AOJu0Yya7kJCDemHzeNcJow0i4QhIl4eyLRHyG7I8pHiCPKt5IlszBsY
	veCCgRNjPLFzjH03jKlq5WO4js8573j016kjShTodDNxeWioJyCWgXIgpLoHnYmhZvuT4uVErSL
	T1Cy6BoIf0NzLDoGec0nRz4cJQGRTQ3KzloJHGAhL/MPsDRrgpE83zKCMYe0=
X-Gm-Gg: ASbGncuwGz4bAhx7VCjQ1IZe5x29ZffILzpe9Eeibk43bfWVE6BQo1N6Hri3L96xFe7
	V1sfeGBTtl4FRHxRkXfGE0y1m0pOWkZn9fzOufkPsU/DX2eH85O413m5MxqSHjaR5M96w3uOKcP
	/nsrRX5iZCSHE/VEC3ptjscxcESMfg2gEWhaKIXVCEAl4ZX+7krTTQ6gDJgLisy1ClVn7oPxBU6
	yXqcM7j97zzSAxo2cIQ7uW5OBghuqeSwYJ10rPRQ9fnnHwdY+yZaSTEVIE34OZQdVYeZpju1xT6
	e/wmK+VTZ6S73twpArGYV8QsOiHS8sPojxitLwM0KQKR4TUMNRw9nHm4cVOKBdLYbf3gG97vnRg
	=
X-Received: by 2002:a05:620a:318a:b0:7c5:9a09:cb73 with SMTP id af79cd13be357-7c956eb0848mr397817585a.23.1745504539678;
        Thu, 24 Apr 2025 07:22:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtKsnAq4edi4L2zcuU1p86GlDxABBSgUBDDvex1rb/PCJbPCrx+MhG2r68bKIx6STEWRZ77g==
X-Received: by 2002:a05:620a:318a:b0:7c5:9a09:cb73 with SMTP id af79cd13be357-7c956eb0848mr397813185a.23.1745504539147;
        Thu, 24 Apr 2025 07:22:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cca8ef7sm248945e87.186.2025.04.24.07.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:22:17 -0700 (PDT)
Date: Thu, 24 Apr 2025 17:22:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <quic_vgarodia@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>, linux-firmware@kernel.org
Subject: Re: update video firmware binary for SA8775p
Message-ID: <w7lrgbrnx6kwoel3rzwsz2sa6g6f2t6so2bm5t3fqcpxlbwp65@fxbwih4jpsc4>
References: <798a8c89-d977-603f-43a6-ea836d3f459f@quicinc.com>
 <toxomfkw6v2cb4fys5s73tzahccfpxqsxp2hjt2r3xkge5qc5e@bgqtxusxvynl>
 <222a5475-c63e-44de-f9da-4a993a70623b@quicinc.com>
 <6xt3dmrd6z26na7e5kqro5ws3ulbm4wop2k7wl5wt3m2fr4rql@barhdtegzw5s>
 <5e296369-0960-680a-ca35-916e3b733d4d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5e296369-0960-680a-ca35-916e3b733d4d@quicinc.com>
X-Proofpoint-ORIG-GUID: zeWLPbaVvsnzgTJaLa41vLyasjAgesnE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA5NyBTYWx0ZWRfX/GwmgG5SWjTq TE/gMM+cW8kp/kp0/096V1ITwQyTUm0MgijQRC27q2MEnmI+0SubpQuRmsFTrNsOcV53bBG/wyF eWi5kFqLpdr5uL7T6bPCN+8nw1mx6VfGgeMnxIpNVqppw0ULtNJ5ZUni3XaQOF8wYgHWWlb4zCo
 BDKu0UVgW9ZjO0fa8jprK0p8f6e93o7EInWA+FFP2HmvSjZ9S1gKIRyx1kbySEOP/BLdYLHkTrH f4qRhFHG377H40YUbyBpUdkumdv422qxAQl+7l70iuDpK7ovxsnGWlezI6+FqGKBUy2vJArTcjj jAtl/jAGRjr2gOluAhOLU5MOYD1kqUkZAqfCbeW53OUaVzKdYOQrMZCEY0PXhp+aJxUItY3KEwn
 mfBPjmAjEpdoZ1A64ZDqYQV7ox2UeNMNosD3IzxIa9eiX+sMKg+Nyx/G1OfJd2366oQZAGTx
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=680a491c cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8 a=gJaVLq4Kj6uc8VllTZAA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: zeWLPbaVvsnzgTJaLa41vLyasjAgesnE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_06,2025-04-24_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=762 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240097

On Thu, Apr 24, 2025 at 05:30:37PM +0530, Vikash Garodia wrote:
> 
> On 4/24/2025 4:48 PM, Dmitry Baryshkov wrote:
> > On Thu, Apr 24, 2025 at 04:25:06PM +0530, Vikash Garodia wrote:
> >>
> >> On 4/24/2025 4:13 PM, Dmitry Baryshkov wrote:
> >>> On Thu, Apr 24, 2025 at 03:48:24PM +0530, Dikshita Agarwal wrote:
> >>>> Hi,
> >>>>
> >>>> The following changes since commit c67433231cbd8bcf90b5563bed22fc7a62bbc2bc:
> >>>>
> >>>>   Merge branch 'robot/pr-0-1745441634' into 'main' (2025-04-23 23:24:26 +0000)
> >>>>
> >>>> are available in the Git repository at:
> >>>>
> >>>>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> >>>> video-fw-SA8775p-16MB
> >>>>
> >>>> for you to fetch changes up to ef226c72835b1f8521e855f5a12640b8991d1ef1:
> >>>>
> >>>>   qcom: vpu: update video firmware binary for SA8775p (2025-04-24 15:07:18
> >>>> +0530)
> >>>>
> >>>> ----------------------------------------------------------------
> >>>> Dikshita Agarwal (1):
> >>>>       qcom: vpu: update video firmware binary for SA8775p
> >>>>
> >>>> WHENCE                        |   4 ++++
> >>>> qcom/vpu/vpu30_p4_s6_16mb.mbn | Bin 0 -> 2311988 bytes
> >>>> 2 files changed, 4 insertions(+)
> >>>> create mode 100644 qcom/vpu/vpu30_p4_s6_16mb.mbn
> >>>
> >>> How this is going to be used / selected?
> >> Once the board memory map is updated to have video PIL region as 16MB, video
> >> driver would switch the firmware for that board to vpu30_p4_s6_16mb.mbn.
> > 
> > So, by changing the DT to point either to the old one or to the new
> > file?
> Thats right


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
