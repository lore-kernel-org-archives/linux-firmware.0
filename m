Return-Path: <SRS0=8enH=35=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D808CAC5A0
	for <linux-firmware@archiver.kernel.org>; Thu, 18 Sep 2025 12:12:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 053CBC4CEEB; Thu, 18 Sep 2025 12:12:45 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DB7E8C4CEE7
	for <linux-firmware@kernel.org>; Thu, 18 Sep 2025 12:12:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DB7E8C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58IBjQvr029609
	for <linux-firmware@kernel.org>; Thu, 18 Sep 2025 12:12:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dinfgDq8qMFvg2JIRRjLlZSuMbEaLrqiln2nYI6pQG8=; b=QlXTfiYQJ8EPGqzr
	hCuTO3K7d8sOJ8MJ0MSeQuWi5V6sD7NrFKd51wzahC7/NmnIArw2aej+bbfEmm1I
	KjBlElapzPazD8R6JgeIcX3aatSaeOBf7qBpxdm25tuh9PoGDDAEnz87SMbzIRP6
	Ka13pEtaPNF1DYDqLQCOb6sfQ/ggQb87OqGCKs1sLlYpEzCswFs3mhyBU1TDITpG
	tIKEkmcX6YRjlyTKZu5riKQ0aHB6ZDmxxojCM7n2WEdR6d14c3JT/Nk936KPlimm
	nwRekv56KqpMuUIcyIhq8ZDzJ5OyDOBKh9FSeOVt2aoJeVwuTWysNgtmI5MB7j21
	FXEd2Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy0x7t2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 18 Sep 2025 12:12:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b5f112dafeso23795701cf.1
        for <linux-firmware@kernel.org>; Thu, 18 Sep 2025 05:12:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758197561; x=1758802361;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dinfgDq8qMFvg2JIRRjLlZSuMbEaLrqiln2nYI6pQG8=;
        b=tN0F42xDetYG/FYPnwCAcBBtI+iHXgqYT4oeoTXP91neBgOz7B3qPhWCtWzzt//ds9
         4cHixMlzmEnez3wPFY6X7kBHMYLzMWtb8jrck9Ky19Q81xKHz3A47Hq7zPeP3e+X9kpp
         0lbQ+1btcXQNBJXkJg5G7O8LOqd3PQZ40j52CkuOCU6oYNX5ZjHQaCl+pwavEJnUcn4C
         nwt6ZLnZOXAq6OeZ/4e3gNfRbW2XJo1dJGzxGS/+b+sDOiq+psK0MXCLBsuMBJbVhbwe
         IK2zTNfaz5umpnZl6IYXuIdUClqcpTygzzrShsF2lgKKEX9C7uEknAFbAbzxnSLVBIpm
         VlGw==
X-Gm-Message-State: AOJu0YxGWGOzoxYHubw7/uEd6N8piHfoJ5OkCrsdsq5a6xKRA4lBupER
	8hlGs04YzfuNVQZ+APN65fdNFJEjMrFpLEG53mvaMxifJy47x0lbuplzqtGVBkJuzu3Y+klzdQQ
	7Yr5okJ21I8LkvNOq6F4taPFpnS5+pSgczu1s0CxMd524ZgJHF0Rne6+NlEQt8lE=
X-Gm-Gg: ASbGnctlWjtjJW93bW6zUqcBML6h1Fze3yet6FgorLsDX7aZq6QOvGs1IvXu6NxBZAE
	i4yc7SNECyCZpgV5tnh+JOVIFENUmmJDJzPcUYoa+brnkfhzTFuWx88N3cdcEbjl7sjZK0Ye9Ct
	8osvx/QWhXe1C+iH/MZwGgP2GDrtNdijBV/MYx17SAsulxoGBChSk1BAfiv4P7OwpnK0xcPrduI
	kmzbi891iPxUaEXKQ4M5MlZOyZFjCJV91ytr/5xMjQ4vGzdEiSF0QVpUVQTFhQvl98540EAPz0J
	cz/17XBfKl7L2GWdMH+mImlIuq4cNcrr0hyvPxp26hqXODgYMlniog45GJkP43a+nFMFn6bO+D4
	oOMtMWcqAMM9qQ1Ut7BD6IBf+ySiH2GAAoYNQbd/YwGUZPAYLuFTs
X-Received: by 2002:a05:622a:588d:b0:4b7:9644:d380 with SMTP id d75a77b69052e-4ba6b939fc9mr60942231cf.55.1758197561392;
        Thu, 18 Sep 2025 05:12:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGC6OeXuYWlPRsFIyHfwDAMmrpEIEYtM7JecFt0frst8XfiaDO1ds9QBaprQG7MeCL15yp3Eg==
X-Received: by 2002:a05:622a:588d:b0:4b7:9644:d380 with SMTP id d75a77b69052e-4ba6b939fc9mr60941761cf.55.1758197560696;
        Thu, 18 Sep 2025 05:12:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a5f4472asm640100e87.5.2025.09.18.05.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 05:12:40 -0700 (PDT)
Date: Thu, 18 Sep 2025 15:12:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, bkumar@qti.qualcomm.com,
        ekansh.gupta@oss.qualcomm.com, kssb@qti.qualcomm.com
Subject: Re: qcom: Update DSP firmware for qcs8300 platform
Message-ID: <j4g2lqbvaj2iow7wg5bpshpcrvyrfhyvwjxrnxtgfd4kh7uoyy@7mmc6lzz6gfz>
References: <3b566cd9-40ff-430e-bcae-1136cbabdf11@oss.qualcomm.com>
 <5gftkkb4i65gadzrnbzilsucrgcj76jj4ovu5yqt6fzfodiuva@eyctfaizlxy4>
 <3b21eb8e-4124-4ea1-a8a6-2190d25e2226@oss.qualcomm.com>
 <4d8f8608-4db2-4687-bf82-260ae32620f7@oss.qualcomm.com>
 <9b6b5ed9-f379-4e3c-984a-f871be939183@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9b6b5ed9-f379-4e3c-984a-f871be939183@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: _NR9BJtMnmc1iLWqU4M5rlmC3g2tb2h2
X-Authority-Analysis: v=2.4 cv=btZMBFai c=1 sm=1 tr=0 ts=68cbf73a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=qC_FGOx9AAAA:8 a=ukPJRTlDDlfdqGbGUFEA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: _NR9BJtMnmc1iLWqU4M5rlmC3g2tb2h2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX3V24oOn1YPpq
 ovthbRx7o362mzJjA7HEeh7Hdku88zLbz65vYxJMBFFgcE8BJ7phpszymdKmhJeoHfeelHkpVlg
 PB44O9/Ye1HmTM6JoA1BYhLu4uVLFs/wFh3pETMyfBWTjZWNY7Dtnv8T8dINk2pxkNQzMfuYa+5
 rJHC94QpkAE5TyMXqesShxyr1K4oCP3qLx0TVD773HsuLYTV7XamE+eaa1b8/9KmffmH/U0Hbee
 MRF4kNjjlPBIbzbdqWPX4NMF1/AkDNF4kwos0rE7QxAw42JynBtEdaddhv2CC59uHUQ1PhATHaa
 Fn5OBzQ3Xe35+jMjgm1zUYwQx317DPPivBowplbKtDoV2U6Oz+7f7ucHcAOeQeGh3jreLTrq+hn
 Hdbx2gTu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 spamscore=0 adultscore=0 phishscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202

On Thu, Sep 18, 2025 at 12:11:10PM +0530, Venkata Kota wrote:
> 
> 
> On 9/18/2025 12:06 AM, Venkata Kota wrote:
> > 
> > 
> > On 9/18/2025 12:04 AM, Venkata Kota wrote:
> > > 
> > > 
> > > On 9/17/2025 6:11 PM, Dmitry Baryshkov wrote:
> > > > On Wed, Sep 17, 2025 at 10:31:53AM +0530, Venkata Kota wrote:
> > > > > The following changes since commit
> > > > > f0f4634972f48c3330896bde5c94557b568a3a68:
> > > > > 
> > > > >    Merge branch 'en8811h' into 'main' (2025-09-12 14:23:45 +0000)
> > > > > 
> > > > > are available in the Git repository at:
> > > > > 
> > > > >    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> > > > > dsp-fw-qcs8300_1
> > > > > 
> > > > > for you to fetch changes up to
> > > > > f504dd64f1f5fde3aef24fcecfc165cf8845b22f:
> > > > > 
> > > > >    qcom: Update DSP firmware for QCS8300 platform
> > > > > (2025-09-17 10:30:17 +0530)
> > > > > 
> > > > > ----------------------------------------------------------------
> > > > > Venkata Kota (1):
> > > > >        qcom: Update DSP firmware for QCS8300 platform
> > > > 
> > > >      GPDSP has a capability to support Audio PD use cases.
> > > > 
> > > > and? What does it mean and what does it have wrt. the commit contents?
> > > > 
> > > > Please. Please. Write sensible commit messages.
> > 
> > Will check and update on the same.>>
> Updated the Commit Message and pushed a commit
> https://git.codelinaro.org/clo/linux-kernel/linux-firmware/-/commit/36da01bec9809f7bd96594db4885a86c286e90a9>>>

And how is it relevant to the audio PD being added to GPDSP?

>   File: qcom/qcs8300/gpdsp0.mbn
> > > > -Version: DSP.AT.1.0.1-00096-LEMANS-1
> > > > +Version: DSP.AT.1.0.1-00125-LEMANS-1
> > > > +RawFile: qcom/qcs8300/gpdspua.jsn
> > > > +RawFile: qcom/qcs8300/gpdspr.jsn
> > > > +Version: DSP.AT.1.0.1-00125-LEMANS-1
> > > > 
> > > > Do you see the Version tag under any other JSON file?  The jsn files are
> > > > not versioned, please drop the last Version tag.
> > > I have remove the Version Tag now.>
> > > > > 
> > > > >   WHENCE                   |   9 ++++++---
> > > > >   qcom/qcs8300/adsp.mbn    | Bin 6643712 -> 6684672 bytes
> > > > >   qcom/qcs8300/cdsp0.mbn   | Bin 3084288 -> 3080192 bytes
> > > > >   qcom/qcs8300/gpdsp0.mbn  | Bin 5832704 -> 5873664 bytes
> > > > >   qcom/qcs8300/gpdspr.jsn  |  22 ++++++++++++++++++++++
> > > > >   qcom/qcs8300/gpdspua.jsn |  29 +++++++++++++++++++++++++++++
> > > > >   6 files changed, 57 insertions(+), 3 deletions(-)
> > > > >   create mode 100644 qcom/qcs8300/gpdspr.jsn
> > > > >   create mode 100644 qcom/qcs8300/gpdspua.jsn
> > > > 
> > > 
> > 
> 

-- 
With best wishes
Dmitry
