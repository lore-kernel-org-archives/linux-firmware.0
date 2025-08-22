Return-Path: <SRS0=At1r=3C=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9305CA0EED
	for <linux-firmware@archiver.kernel.org>; Fri, 22 Aug 2025 18:07:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8548CC113CF; Fri, 22 Aug 2025 18:07:33 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7C0E0C4CEED
	for <linux-firmware@kernel.org>; Fri, 22 Aug 2025 18:07:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7C0E0C4CEED
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MHVHZp021308
	for <linux-firmware@kernel.org>; Fri, 22 Aug 2025 18:07:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bUd7FZPRS0c+z7EBEMPROChC
	RyWsMkVZVbHIunSwd7w=; b=ZVrynuRagKOq6WtB9t/XV7LsEWqVwyef5ESU++wl
	EVHXxSkliNEmoSwPJtOMZBxVXHrjHqgqwAfQt7pkdyJQs7DwyjLcoCvAXOH28GYS
	PPiDb8RcFpEGFQIo8/5jWigrLdOOll+sHknFvmbclz3LMiM6LjGxpfWoYogIPUr0
	niOor0vY0ABHwBMd9mKaauy+PCs5OiQ3+yFCZ6GTfwfbvnGkzaJR+3BFWwQwcl3G
	FGKZYT5eiNNGAkh9w0T/JlggtUZ5S6u9ARHzIa5IRCfrNZcww4rHdPwA3SuH7+uX
	yt88u2Z91gbFKWDk4N0KaY/y35C2IwuzutNuyRgYHuuTow==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48pw13g3jg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 22 Aug 2025 18:07:31 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70d9a65c324so19163786d6.3
        for <linux-firmware@kernel.org>; Fri, 22 Aug 2025 11:07:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755886050; x=1756490850;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bUd7FZPRS0c+z7EBEMPROChCRyWsMkVZVbHIunSwd7w=;
        b=O4PCrMSaLoYArX3RQls41OuIjsl3QOPk8GQTfv4kedsSTcidTYfIkXqxwT0CMWFb5y
         d+11UD4jLdyOv9gRBLXruyw3yIK2fdDn48d2WMv16iU7z+QCX1GhWHswpeHEqNDcclZ8
         3rNJ1har+NB/WsjmrFGwBNWF5arLe/gckHRP2fRixw0B7eFZlulfq1osCzXw0/V2yNEX
         lQ5cSTi+W9P/5QFpH2s/m6Ujn6JDx4Ne446jp7E2MTpEMbeNK5zdvD196EvKdmYMULdz
         kjYkQjN/EGHvPO9xaHqLl8+gDe5og7h5Ye2FTUFKE8PlIzlRYC32zlfRMifHa7etBftE
         mNBA==
X-Gm-Message-State: AOJu0Yz9FvdmLvET8CY1SrtJXP4lxa2OR6bLirkyfe99IPwal4aoGR6c
	uG52W+bNiSc2pmXpENWzyaSPK51O1U8EKvrJry8TMCBa3xc0nrK/ZOHocywcyDiVQO9Ac+xozO/
	sQhjesQu7vM6GsrGZiEngiBrjb6NPZBKKhnQmvkrH0rmskjTh0l50c/gLoq/AS/M=
X-Gm-Gg: ASbGncte1p9M0HTwxLyHHzbDZCCwYU3qM0xkdbPsapInwz/QRFtxA0owZovUuCONEGs
	wU6sQN41ri4FMkm+EjKz1nhzdFD2Ixuv0eNxEU6zHPLJFN95qhmx4HD4pAVWKrgJGgHEX7xTIL3
	MsvEddUnOcFaMrOW8bfsMEXS9vf2j5itMupujUKH976mytGH/DIeTO4BRKFohOL6kE01BgO6NHC
	W+d+PRsZt/XifPx11tRUMSQmVYq8lXgPuTKeG8Qaqa6keY6LexXJJvsLcDzk7lfFwXUOd0rY6GU
	YzTb0ZUWM37dqZwWJIjxwRmucVsBbQTA5yjHCnZTLkUByJmfZ8nBGZBgZLc13pxRDb0iMk6b24B
	9k/yLRBg9sFJAAeO6Acg7E5c1zIqZxFBsCYJP8aA1zB/JDmpGN0D+
X-Received: by 2002:a05:6214:ac1:b0:709:65c0:ae8d with SMTP id 6a1803df08f44-70d97326550mr43557936d6.50.1755886050095;
        Fri, 22 Aug 2025 11:07:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7KUjSa1CxEEaQ4Ge0VTq85hGt50dNVsfPiYBg9RlXsTsxK5KcBvr7QKB/cSgk5dqwgTbIXw==
X-Received: by 2002:a05:6214:ac1:b0:709:65c0:ae8d with SMTP id 6a1803df08f44-70d97326550mr43557466d6.50.1755886049508;
        Fri, 22 Aug 2025 11:07:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f35c136a1sm86351e87.52.2025.08.22.11.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 11:07:28 -0700 (PDT)
Date: Fri, 22 Aug 2025 21:07:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,
        "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: Add firmware binary for SM8650
Message-ID: <o7bbn6kh3xv7bk53izuqwsvvzslauy2ldeqjiet3lrusplwand@gf3s6s6jxqrx>
References: <2ed59e7f-c8e9-7c29-b1e8-d85058a022b9@quicinc.com>
 <mwa37ubagjrmxlh7etjwlxsacrt5c455fn2no3gp6vjavnaner@gc7jwulrgen2>
 <f3f6f8e0-f7e2-3f4c-8277-4985adbd7ed4@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3f6f8e0-f7e2-3f4c-8277-4985adbd7ed4@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIyMDE2MCBTYWx0ZWRfX6jk/wOwLDc0e
 MY1gh2saowKPTyTAU+E/dyhkODyZYtrUmoluPl2uVqt2wqcOAAbJuIs5OLnrTxUh11PU499d4rQ
 SVUN4wPPpEam3/ZuKVpmU8titsYGYWSqxKWZ3OzCUUnwsBirZOkhXR65ioEA8vPM40Nj7pTWZ3+
 sOns9qAvcBecS4T8WZHcL2mcTEk3AJtrpNVLutEzzzm+IeyaT1oEgjzSdq9nnOALpYCccB02+aq
 +hQ0YZ1hS0ADn+Gl8szSU5v+mgv0NnvO+IHW7fjmBw5egmVUa0LR59cK4vHUiow+2VnAegwh0u5
 WM0X6uBflloxYpeMk05xYV4q8YdZDiAsdx47eZx2N2+0QTl5o3tmiLbQpKQnEdTKOVsq6Gc+ptp
 w+V21svv
X-Proofpoint-ORIG-GUID: fmUbYphJ3lTiWjJ3D9ovakB8-NmRviWK
X-Authority-Analysis: v=2.4 cv=F6NXdrhN c=1 sm=1 tr=0 ts=68a8b1e3 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=qC_FGOx9AAAA:8 a=4TiWOzCwD0-sGkDnMKcA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: fmUbYphJ3lTiWjJ3D9ovakB8-NmRviWK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508220160

On Thu, Aug 21, 2025 at 02:11:16PM +0530, Dikshita Agarwal wrote:
> 
> 
> On 8/20/2025 5:34 PM, Dmitry Baryshkov wrote:
> > On Wed, Aug 20, 2025 at 05:24:44PM +0530, Dikshita Agarwal wrote:
> >> Hi,
> >>
> >> The following changes since commit 697065607ca2e09fe02b0d6c7c2bf7bcc96243a5:
> >>
> >>   Merge branch 'rtl8723-bt' into 'main' (2025-08-19 13:23:06 +0000)
> >>
> >> are available in the Git repository at:
> >>
> >>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> >> video-fw-SM8650
> >>
> >> for you to fetch changes up to ece445af91bbee49bf0d8b23c2b99b596ae6eac7:
> >>
> >>   qcom: Add firmware binary for SM8650. (2025-08-20 17:23:16 +0530)
> > 
> > Could you please make sure that VPU firmware list is sorted in the
> > WHENCE file? I should have cought it earlier...
> 
> Sure, the current change is merged, I can raise a separate change to fix
> the order of all firmwares.

Yes, please. I think that would be a good idea.

-- 
With best wishes
Dmitry
