Return-Path: <SRS0=fta/=33=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D953CAC598
	for <linux-firmware@archiver.kernel.org>; Tue, 16 Sep 2025 10:33:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D57C6C4CEF0; Tue, 16 Sep 2025 10:33:31 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 113D7C4CEEB
	for <linux-firmware@kernel.org>; Tue, 16 Sep 2025 10:33:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 113D7C4CEEB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GAFG3Y001636
	for <linux-firmware@kernel.org>; Tue, 16 Sep 2025 10:33:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CPJo6vJfif5NxS+dOpKXI9mP
	mh0T0CxSbCnu/iQENyI=; b=CEB9aTAn1WXjfIW49Kp8CYGP+kVoz162AsZSqDHK
	1LXNqqCoq+x38pKF82gDNsrpeXbLSl87Gal8YpY31BYrXAzIiY+nWaoboqKjHdnN
	DmRyswFhv1DNsqsrexAKUm4n/PfaQ+E5C7JUkQB+Hhw5v4X5IHSwSq9g05uM886E
	fVZxsO+0ekqUZm5u4zlZODZfZMNmhtFTS6dTeyUqj+BaoWnmJ7JPJXuK/0EKNUUu
	S77tkUf0vZZFIF6HRtVKN9GkTSu+Z46siDrdnEcDl+Jlcvgd6I7GM5TTYsPa9PAf
	u9uTo9nkiK79XNLQUJbIjSFnwTAzXOMUp1XtsXqmc3zv+g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 495eqpygy7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 16 Sep 2025 10:33:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b78fb758e9so51940391cf.1
        for <linux-firmware@kernel.org>; Tue, 16 Sep 2025 03:33:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758018809; x=1758623609;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CPJo6vJfif5NxS+dOpKXI9mPmh0T0CxSbCnu/iQENyI=;
        b=bAf4krBWhshqYsoJYIAg6+plEDXWDST5LIKhn8KQ0XSh+73bkl4zAZ3KYsE6FNr6qz
         IzQAzg5e6cpRAUdan7w6rhlNlrxcwf8n4t/6RoEAFu5GTtO4t/6qD3pOEEYzXXNo5JzE
         FxKsVcGuvxpoGEPXyHLRllaOgQZUNwRW0TQlsrifhP/EvDVlwvydsu8bA/Lalg/KJ/Qx
         GYRk4xXtG1kZf4le7J+GEdj+6+oyz+Da5Bl85RfYjyJeEOw6OzzZayRUEAeqR5tCOy6e
         FmrZ1ph/b8Y1sXIoYngMWinokJtKmgLD/quvImPtvLl+hCVmewOilve3nmteBLGiwXWK
         viQQ==
X-Gm-Message-State: AOJu0Yw40xjVsbahGbjYGW8ylbttDBZ3fY0zO1dHqpsUtcZSkC0OTk48
	a8uT1yaoTJeJnCVOKSpxDMYzHyZ86PmLkCN9fu/dTlvQR405XQIcl871/2WSLUGJPcRaPpRSghf
	eocTzjALNzGh/i55EIYjMTBteBI0o9IvN1fUlOwVT+E8/3JT+vVOwBEorOK19XkQ=
X-Gm-Gg: ASbGnctrJCsIl/w8WZhANRQ3o5HWCcrxM9g6SXwmq/a1Nn2qirmNnv1naM7OsFCPoVL
	l4KeCQ5num/b+6aJd9kSyfD5mjXOOu7lYe1PDdM74sgfwAdKyW2AXy3xfQWGocvd9mdMkaV+z9Y
	VCakAEYmyxzSGK66i+jJYx7GvWBfzpR+KCW/Loac+ARQdSpuRAiBoJ1zRFGMRlu/cfaJKIRbR3l
	sIfTlxquNuGWSFG6wOqGnPlgmbkjB8+6/ztFwl6W9S4riXlAfuhWbWOgBjBSBQNRoCBiEXxrWMm
	c9lebKYeVAdsIwUKO8eLBVQTf2siE2DTq7qxPeEpf6CKQIapBWd1SME/ZmfWMrQX7GagYqQG/R3
	jT2ddsI6wYQ7pptudyfp/LMLnZHnP86KgNQGk+6n+3WTOkEAKhKwS
X-Received: by 2002:a05:622a:1211:b0:4b7:9e60:e344 with SMTP id d75a77b69052e-4b7b451d989mr19583311cf.31.1758018808414;
        Tue, 16 Sep 2025 03:33:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7oocqTD3DJG/dS2IasjIhlDEbDR+64zNQOrZODi10ayV9vR5ZhU3gr4CcVQnHZeBCE6tM+Q==
X-Received: by 2002:a05:622a:1211:b0:4b7:9e60:e344 with SMTP id d75a77b69052e-4b7b451d989mr19582871cf.31.1758018807787;
        Tue, 16 Sep 2025 03:33:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e646135b0sm4210573e87.110.2025.09.16.03.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 03:33:26 -0700 (PDT)
Date: Tue, 16 Sep 2025 13:33:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, bkumar@qti.qualcomm.com,
        ekansh.gupta@oss.qualcomm.com
Subject: Re: qcom: Update DSP firmware for qcs8300 platform
Message-ID: <uppoywqq5vwyn25yj2drh7d76aq6mywbstqnwg5zv6xrzpucre@eq25h6dudo6b>
References: <bc6d5804-1967-4b59-8de8-17e8bc2313cf@oss.qualcomm.com>
 <xopfgtlzht3l2clqwydghyzckpub3brocmwvclchbi5gigst3h@plhqa3gpdire>
 <87f13c96-a334-490b-ad9e-cc6fbded6440@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87f13c96-a334-490b-ad9e-cc6fbded6440@oss.qualcomm.com>
X-Proofpoint-GUID: fBc11leibJPLWTDdlcjLIop6fEEYnfHl
X-Proofpoint-ORIG-GUID: fBc11leibJPLWTDdlcjLIop6fEEYnfHl
X-Authority-Analysis: v=2.4 cv=XJIwSRhE c=1 sm=1 tr=0 ts=68c93cfa cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=qC_FGOx9AAAA:8 a=CldDwZ_7MnoC_qhv6xIA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDE4NiBTYWx0ZWRfX+hL7o3cbm+vE
 VPuTlzonxYOsw+FsAxdpAqWvxmVGvVt1IsDtL7c/2frpo1vcyihIdCXGUR7PSJ8AGBa4u3qZ5do
 PhNMHvl+g1VH8tjy2544hVxseM3OvCvyO2NzCHLaKNr8GhwWD8iijUpIteaZ27qMoJFeiEfVfnQ
 /0sgaWJCTCgbseCJuUaDX23n/jI6WWSgYN4jISSZsr7Fp9f27DOvxOZWyekhXzJNUnZdFgDVnEZ
 rHFWwbVwTkH7r5XjsYZRXQB/+fs0LIgeTA1y+Jx6rGsLEFlqHeMumeqU6R+CyhzU5h+RQmxCpZI
 DovPuIjWbTVrEPhax9/3YrtPFUs+7y7cz7LiAljpCw7gF7pInme7A1rIzmXXFhwnSopMPbwmNjg
 YUtWcMp2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130186

On Tue, Sep 16, 2025 at 03:52:04PM +0530, Venkata Kota wrote:
> 
> 
> On 9/11/2025 5:27 PM, Dmitry Baryshkov wrote:
> > On Thu, Sep 11, 2025 at 05:04:13PM +0530, Venkata Kota wrote:
> > > The following changes since commit 4573c02ca0caf001c5ce5dbb62015d588258588b:
> > > 
> > >    Merge branch 'mt7922' into 'main' (2025-09-09 12:02:45 +0000)
> > > 
> > > are available in the Git repository at:
> > > 
> > >    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> > > dsp-fw-qcs8300-dsp125
> > > 
> > > for you to fetch changes up to 13410ff8f90a06e2544236b13384f3068d335ac4:
> > > 
> > >    Updated adsp cdsp and  gpdsp frimware for Qualcomm QCS8300 platform
> > > (2025-09-11 13:28:42 +0530)
> > > 
> > > ----------------------------------------------------------------
> > > Venkata Kota (1):
> > >        Updated adsp cdsp and  gpdsp frimware for Qualcomm QCS8300 platform
> > 
> > - Missing commit message.
> > - Subject doesn't start with qcom: prefix.
> > - It should be 'DSP' rather than 'dsp'.
> > - Rogue doublespace in the subject.
> > - You've added a bunch of files, but didn't mention them in the WHENCE
> >    file.
> Ack. Will address these points in the next spin.> - As far as I remember,
> GPDSP1 isn't present on QCS8300.
> I see adsp and gpdsp1 fw for QCS8300 is same as that of QCS9100
> I accidentally picked gpdsp1 from QCS9100 here. Will Rectify the same.

Hmm. When are we going to see firmware update for QCS9100 then?

> > - Adding audio_pd to the GPDSP needs at least some explanation (in the
> >    commit message).
> gpdsp1 has a capability of supporting audio pd but at this point there is no
> active use case for audio pd on gpdsp for qcs8300. Should I drop this for
> qcs8300 all together.>

No, you have to explain what is going on in the commit message.

> > > 
> > >   WHENCE                   |   6 +++---
> > >   qcom/qcs8300/adsp.mbn    | Bin 6643712 -> 6684672 bytes
> > >   qcom/qcs8300/cdsp0.mbn   | Bin 3084288 -> 3092480 bytes
> > >   qcom/qcs8300/gpdsp1.mbn  | Bin 0 -> 5844992 bytes
> > >   qcom/qcs8300/gpdspr.jsn  |  22 ++++++++++++++++++++++
> > >   qcom/qcs8300/gpdspua.jsn |  29 +++++++++++++++++++++++++++++
> > >   6 files changed, 54 insertions(+), 3 deletions(-)
> > >   create mode 100644 qcom/qcs8300/gpdsp1.mbn
> > >   create mode 100644 qcom/qcs8300/gpdspr.jsn
> > >   create mode 100644 qcom/qcs8300/gpdspua.jsn
> > 
> 

-- 
With best wishes
Dmitry
