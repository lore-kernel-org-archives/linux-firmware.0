Return-Path: <SRS0=gdgd=4M=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18003CAC5B0
	for <linux-firmware@archiver.kernel.org>; Fri,  3 Oct 2025 01:01:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D1F75C4CEFB; Fri,  3 Oct 2025 01:01:52 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 343ACC4CEFA
	for <linux-firmware@kernel.org>; Fri,  3 Oct 2025 01:01:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 343ACC4CEFA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 592NDFWU023589
	for <linux-firmware@kernel.org>; Fri, 3 Oct 2025 01:01:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dh9YkkEp3hAIulmgUloRVWSZ
	ugF2SH1EUCN+CS8/kA0=; b=hnNKf5L5zafCeUF3wcfyAkAjYDE8usBD8ybTanxV
	DRCqdYB6G0l3eWXrcoTjvJpdQXaJsyvprbLmBsm07xWYa2ev2SVGNg1ubYMuLvYJ
	janwBUEjIxrAIL1ZXW1ksM3qG6WsAps5hAUL7uxh8h5U65CQ3BYCbkUgtbLNF2+G
	yX0mclnl8xKKRNcXe5i4zwIZs/wf7mvJpEcdW/R9ynsNHCsgZGzfAXllohoMNXO5
	NUU/LwfR3K7LZQlNAQ2iglKJ1TylpaIMXN7i8OAIsritRJLnKs6GYph1XOjlV9fj
	xUOqRM91pjwZf69m14PsKkIbkQQtKIKcsM9n/cSFqWJGFg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8a69eby-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 03 Oct 2025 01:01:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4dfe8dafd18so70594101cf.0
        for <linux-firmware@kernel.org>; Thu, 02 Oct 2025 18:01:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759453306; x=1760058106;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dh9YkkEp3hAIulmgUloRVWSZugF2SH1EUCN+CS8/kA0=;
        b=d660fOd/QnrRqDKAErwx2liHjvR2MHeUPonAmd8Z1tLCZbAm55MqWYvihPV0ZRGZP+
         EeQbgcoSy65w8LoseO69mt27Cfye9lAh+fYpyZmGXWqKFhVK42Ps/1Q+8chU5sWf+WgB
         EXzEyUSmrQmckWvqc6xlF57KbtyyS93xl8hxPKL5EbcE8kZSOxz5xqAGRJXCe9EEbKiY
         IndDK+zzgqdhB458H24sxC2R4TxbPQAw3RusgJolTNkrQzz+uYx6JVZiy9AwwUu9RZyN
         YHIjgJcLxRcoGMyKZkFAnNQvbpyZWjr6rjdw6IjCZ19hR+pLoaD7d+TZ9E9wpvSD3oib
         9A2w==
X-Forwarded-Encrypted: i=1; AJvYcCWMPaVq0KlAL4dKBUcH7LZ2bzjYxSD2uQZ3xabtHg3ooylN6aIBNiNb7YXqxsF7uw96+T9NeljlAljRSuOrOA==@kernel.org
X-Gm-Message-State: AOJu0Ywdb5vqZobC/v1xQ8AUYreS0phErrS/UDVwW2n0zOu2M1g9aCv5
	+AvkSrEjkMw1IkuMtOdPqo8uN/wrQa3EXEIz8yi99mPc4SLR1ZOwpHxC1UHeUzut3/CcAtM9ogc
	GozZr1s2oHxQ0//rch7ZSf5TUR2x47Jp9IfiILDUF8bCQktndotLLl5dkFMXHjA8=
X-Gm-Gg: ASbGncuZMzGElPXC1v5kP2bQYLqrNsu3iDIeBeKCjZ5QQUh3XYhHt0K+9cOHVA00JIf
	AZtfhr5dceT5TQONL2I3fx6hXJoVIuvkhq3mB54Mfv8ws46BAe6tPo9obFZmV0Bnaltn4l7vrMe
	FYk0uP+Tevp9uZzQMv2T3RrhYgkH3UwUKDuT/IPMw8aDeGcoi2wOGz+Qg7S+xAACg/BGDtk+gvi
	Oio4sL6pwh4HBqFDfTvzQybzD3xbaaOS5Xh/+QSvpfiZhKbAbbpHoTMKZC7hqbeIkV2TZO+VlUU
	iBBnnpeFfZRPfNok1gKqmjN8Us04GkWDv0Z2NCC47L1aZp3P4fJGUJHGrlTu0sE2Jh7Kh9NjEMI
	hk0aPAvASj4SlgSvJSEjvYW6a2h82mTqTb0rzvITTtgd5f9or/aRXoGr3qw==
X-Received: by 2002:a05:622a:513:b0:4b7:a2d0:6a25 with SMTP id d75a77b69052e-4e576aa04ccmr18451001cf.33.1759453305935;
        Thu, 02 Oct 2025 18:01:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9BmvqzosoowW6VCyy3rFX0j0lkiT5wpoPj+C0NBulvC0lFPDrWnzziuy/9w+RwBOQ5gbZ2Q==
X-Received: by 2002:a05:622a:513:b0:4b7:a2d0:6a25 with SMTP id d75a77b69052e-4e576aa04ccmr18450401cf.33.1759453305371;
        Thu, 02 Oct 2025 18:01:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118dd2esm1299405e87.80.2025.10.02.18.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 18:01:43 -0700 (PDT)
Date: Fri, 3 Oct 2025 04:01:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        linux-firmware@kernel.org,
        "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: qcom: vpu: fix the firmware binary name for qcm6490
Message-ID: <hsj3ravxgkhnbnks7wl47qqwsef3loi44jkgahzgx2m7k4sjld@endp4nl3h6ek>
References: <2llwkhpwbkzqyvyoul2nwxf33d6jhuliblqng4u2bjtmsq7hlj@je3qrtntspap>
 <5a03b200-4e1f-082a-c83a-cb46ad4cea09@quicinc.com>
 <zj2dreqyj7fnhiophdtevhuaohlpk3uoccrslkqt5wjt2jhiip@gqnasgvu7ipq>
 <yeJvz1BmQX5QCjBXnjFbGz8gclNViebyCcZC1Rz2tfocg3MxOAncJZruBARGqAzxG_1UJmw35EUBl80KQy5Sqw==@protonmail.internalid>
 <f1e9ddb0-683d-4c91-f39b-6954c23f7f75@quicinc.com>
 <015dc909-ad0b-4367-8dac-bed53c4f7f9b@linaro.org>
 <k4al7vwl4qruiv7olqlj3qe4gah6qrboyzsbnvfarlgr3amili@wjmkthnxsgmf>
 <7933f6e4-e8e7-4d35-9295-e6b91adcc128@oss.qualcomm.com>
 <CAO9ioeUXsb9UisWbc763-2SvU_-2Ce7qmQ27Wzwt-fWSzHBAeQ@mail.gmail.com>
 <b7623cb3-07d6-49be-a8d7-f9512f3cb6ef@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7623cb3-07d6-49be-a8d7-f9512f3cb6ef@linaro.org>
X-Authority-Analysis: v=2.4 cv=RZKdyltv c=1 sm=1 tr=0 ts=68df207a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=clFx2iI0x2tc5NYfKV8A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: n8O_kmie7y2b7yHRqTTo1uo84pp9ee6S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMyBTYWx0ZWRfXwRptsn2lcrh7
 PkVUcMxqFiwBkzT0aSM5R8rWxthKK2oz/OxBuHCDXi75eE7EoFSIECRAd236X+4YiSyfWSUWZae
 5zvQ9HWxgixz+FPlyUIunwCz8sgVuEBpGekqQQmSA7b+VDI2fjaa4geBIyrOmvrcs1yakyr8meW
 EBeyIww5U5yAm00FjHrI1XfcxvKgxRcyjM5K9aBnGK7Rs/behztCVrgZkjYRscWn+c4ENfcUufK
 +I1XmuZm2d4XQBQRGuTwkyMUpGIN6k+C3KhpSdpX3/X+CRRIcP6agKTGo9vDFywo/t810u856Kg
 6P7nCIJ7ztvaS4noj7jL1ZRjvLuGjeGkZhwWrFO+I171uWi1U7o2khoFP8bxnuWuIc7GR4wu03p
 B1O2djSd6m0tJ+rczL8IwCRp6Wf0fA==
X-Proofpoint-ORIG-GUID: n8O_kmie7y2b7yHRqTTo1uo84pp9ee6S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_09,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270033

On Thu, Oct 02, 2025 at 04:07:37PM +0100, Bryan O'Donoghue wrote:
> On 02/10/2025 15:59, Dmitry Baryshkov wrote:
> > > * Iris could be then taught to expect vpu_whatever_gen2.mbn first, and if
> > >    that is not found, attempt to load vpu_whatever.mbn (for the gen1 intf)
> > > 
> > > WDYT?
> > Well, I think that potentially complicates the driver by requiring
> > support for both HFIs for the same platform, it requires detection,
> 
> Doesn't have to be anything more complicated than a reserved string name.
> 
> BTW you're right the main reason to support this is - in effect - ending of
> support for gen1 firmware.
> 
> But then in reality if that is the direction of travel, its in the interests
> of upstream and users to make the transition.

Okay. I did a quick comparison. FP5 has gen1 firmware, is vendor-signed
with the T2Mobile cert and I assume it is fused. We were going to drop
support for sc7280 from venus in favour of supporting it in iris. What
would be a migration plan for FP5 users?

-- 
With best wishes
Dmitry
