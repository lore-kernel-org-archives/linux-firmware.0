Return-Path: <SRS0=8enH=35=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1735CAC59A
	for <linux-firmware@archiver.kernel.org>; Thu, 18 Sep 2025 14:07:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4B7BEC4CEFA; Thu, 18 Sep 2025 14:07:20 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1439BC4CEEB
	for <linux-firmware@kernel.org>; Thu, 18 Sep 2025 14:07:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1439BC4CEEB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58I7WhWV012608
	for <linux-firmware@kernel.org>; Thu, 18 Sep 2025 14:07:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=knaUlnivi9AQr4zYwp2XqAEi
	0C6jDDGyGJhBVLW0e9k=; b=Nhl7spYNnauKGlZIjGp/h3ZJA9CGsmWUuMpIeg96
	AsM5TBFKXcK3yMPGDv65FtGShWsa1CRdHZ5mCRK56Sl+ZmGyzhRfKwS8WYwXS3Us
	HSPXo9bo9UDVYm5h7unL2ThodhuR6SL7Vb0GQSPq5yaGRM3ZTkY1jLRFsaEOod53
	4GQSQUdKKDVOfEiFG1JzC6mWWJjNBG2BlEqjSa3a8vqHt/GrndMdyM7Yp7nZVXFO
	O0w2OGDqjxGKJjfLqSXnL7PF5IQ5EWruOMYI1m3HMidLkAOPCpRnsumX31rwrXk7
	TLT+j0zDDrOA28lDdvY8bx1fYzzYvapoYL36vKnZjuhjVw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4985wx2j36-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 18 Sep 2025 14:07:15 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2445806b18aso12293715ad.1
        for <linux-firmware@kernel.org>; Thu, 18 Sep 2025 07:07:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758204434; x=1758809234;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=knaUlnivi9AQr4zYwp2XqAEi0C6jDDGyGJhBVLW0e9k=;
        b=pCod79N9GrJ25Kq322sRTGrb/lhmcfBJ2Ni3r0N40As3CEWKy6CzJpEzRy308WEANB
         kEP7tO7wVNs5L5xVqW98b1UicU8bM6897TWfAfm2ASp8XriE8VGJ3VFRiCjCVznXkKEJ
         9VaxV5EJcWBVnaasbAmBvH1B8YU/81Ub6wUEYbR7DnnUC7gKmuxhYD0QnaiDEo2ljx8H
         PbBhpfv9LwOMmg9e6DM/XQQk2yBE7fC+7W0WpnaighnppR3qjTtiLJGvt3v70m2vLGPZ
         NzmtV8w34xlUvUgQvaPBpsY6FS8kP7Jf5UaaVG8gnr+oKlfSus4TwYBX2jTiCXmT79Hr
         gIOQ==
X-Gm-Message-State: AOJu0YzthcRiJ4waKsM4d2qEbsstnLfDwT1azEIo0/PBWZ/vmeSEqmrV
	0TseASZykHIssDAMtHoJSU6Aa0fB4cYk2oWYgzQroMZF6jnjAEqHIxhCbm4DEWI7ePWyzxWAsOd
	be5Z0LVzrEAev+WkXyngw95vqWoESgOaTbhwIDB9bUKdB6sl5bRrgvHc3HLZwfvWPYnDfYidDm9
	h5L+1rrmPmObswpDB3JI7C51ZDOalsJb3J1J1Ezw==
X-Gm-Gg: ASbGncssig60B270LEglH3+dKaBErdrk80CdV62zJk9VlIR2Tx4GYXCB/OXrxH3eLqQ
	MkEnmnLREuj3XSUdpthgu+vxKFWChugU6o6DkmHRmQhNFCR0owtGgCBXspB/5lnNk21NtUao7Io
	m4cxL/B5/tk/CuIjsYeKtZfCmpC7xQcDzP4AVNGjQ7gadTNarkWesIDA==
X-Received: by 2002:a17:903:198e:b0:269:8d65:40bd with SMTP id d9443c01a7336-2698d654414mr32799115ad.40.1758204434013;
        Thu, 18 Sep 2025 07:07:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEr17SFFabUZVl6qRtyGzHAcVhCEPPuNkTmK5wKY1HKSw42O5+y+0cwX+0Zp2X8o0Lo1zNjFjGV4EXi0xMEY0U=
X-Received: by 2002:a17:903:198e:b0:269:8d65:40bd with SMTP id
 d9443c01a7336-2698d654414mr32798615ad.40.1758204433528; Thu, 18 Sep 2025
 07:07:13 -0700 (PDT)
MIME-Version: 1.0
References: <fa431a1e-75a9-4c89-b790-81368f30733b@oss.qualcomm.com>
 <zzjkhxoizdb3cukpqqlrgkrwqrk2cgmsuc3bnjrq334pn2zxzz@hwqba3vx7lu6> <4264588a-93b0-47d6-a8be-9ffca550142d@oss.qualcomm.com>
In-Reply-To: <4264588a-93b0-47d6-a8be-9ffca550142d@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 17:07:01 +0300
X-Gm-Features: AS18NWAo4XPRmIHsAMcIWi0osUW0BdS9W_FPvDQLgHJU2KEcrglim7L7VHO6hew
Message-ID: <CAO9ioeVC1H5c4RHoUroytAUbO9hQVvyQ-ep_ofUP-iR7EgDg2A@mail.gmail.com>
Subject: Re: qcom: Update DSP firmware for qcs8300 platform
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, ekansh.gupta@oss.qualcomm.com,
        bkumar@qti.qualcomm.com, kssb@qti.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: nfx0xbbF-nWrMBEACd0fTHkBE_YoOiQK
X-Proofpoint-GUID: nfx0xbbF-nWrMBEACd0fTHkBE_YoOiQK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDIxOSBTYWx0ZWRfX0+8i4AD3MHn8
 XzGEq7J48g3oBVoKRGmtPx1ovE4NN0fSyryQsn74RMKPB7z2gY5YOmYypvzOmtnJT0GvJ1yaavu
 D0J3uBLQkFQUYrmnQu+Yqu7vukxP9oFFNwnlzY30keCXpHzzoTx338UVojyDuDAdz6kxf64O2vj
 IeoVW2OHg04pb/QLQ5gXwV+DmLApYnHKX4/ldNfZ/CboNI/9IwnGx6jpBzdezUfFyyyYQPZQied
 Rt/GgBlO6SDqP1J2999iRA4uEhAcRsBiA+99ovbV6cL5ngZr275dSf6cDAhDqgLVijHS7TCRoIn
 MJLt6H711SxbdZAh4TOXXKny/FVMhmD5VMzXPJa0142JLBdsG645TbZqRheWpFH+p2uiDCUSLXG
 PjpS6H+r
X-Authority-Analysis: v=2.4 cv=Fq8F/3rq c=1 sm=1 tr=0 ts=68cc1213 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8 a=_z7x22sG68nRIB29yPwA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_01,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 impostorscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509170219

On Thu, 18 Sept 2025 at 16:50, Venkata Kota
<venkata.kota@oss.qualcomm.com> wrote:
>
>
>
> On 9/18/2025 5:48 PM, Dmitry Baryshkov wrote:
> > On Thu, Sep 18, 2025 at 12:09:32PM +0530, Venkata Kota wrote:
> >>    Merge branch 'en8811h' into 'main' (2025-09-12 14:23:45 +0000)
> >>
> >> are available in the Git repository at:
> >>
> >>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> >> dsp-fw-qcs8300_1
> >>
> >> for you to fetch changes up to 36da01bec9809f7bd96594db4885a86c286e90a9:
> >>
> >>    qcom: Update DSP firmware for QCS8300 platform (2025-09-18 11:49:22 +0530)
> >
> > NAK, you are explaining what GPDSP is, but you are not explaining what
> > and why is being done. Why do you add Audio PD to the GPDSP?
>
> There is no specific change made to GPDSP in this release. This is just
> an update on the previous label Version: DSP.AT.1.0.1-00096-LEMANS-1.

You have added Protection Domain definitions for GPDSP. I have been
asking you to explain that part in the commit message.

> >> ----------------------------------------------------------------
> >> Venkata Kota (1):
> >>        qcom: Update DSP firmware for QCS8300 platform
> >>
> >>   WHENCE                   |   9 ++++++---
> >>   qcom/qcs8300/adsp.mbn    | Bin 6643712 -> 6684672 bytes
> >>   qcom/qcs8300/cdsp0.mbn   | Bin 3084288 -> 3080192 bytes
> >>   qcom/qcs8300/gpdsp0.mbn  | Bin 5832704 -> 5873664 bytes
> >>   qcom/qcs8300/gpdspr.jsn  |  22 ++++++++++++++++++++++
> >>   qcom/qcs8300/gpdspua.jsn |  29 +++++++++++++++++++++++++++++
> >>   6 files changed, 57 insertions(+), 3 deletions(-)
> >>   create mode 100644 qcom/qcs8300/gpdspr.jsn
> >>   create mode 100644 qcom/qcs8300/gpdspua.jsn

-- 
With best wishes
Dmitry
