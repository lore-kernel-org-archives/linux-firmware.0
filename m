Return-Path: <SRS0=F1LP=BF=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46005F30921
	for <linux-firmware@archiver.kernel.org>; Thu,  5 Mar 2026 09:25:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2D46DC19425; Thu,  5 Mar 2026 09:25:51 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3F67EC19423
	for <linux-firmware@kernel.org>; Thu,  5 Mar 2026 09:25:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3F67EC19423
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62595giB3482642
	for <linux-firmware@kernel.org>; Thu, 5 Mar 2026 09:25:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4+mgUbRRkvIPo+Y1k0oP0yfE
	UJqDnuegGd+SAXexX6c=; b=X3DY4v3i4Sx0kGWhWhvhP3937fvtQleM3/unO41j
	0UZA+fbFT0PdsvNVEgsRt+PwSSzK81EH6U2h4rGjOdY7+yPuL0OEzRShgIdPjnPa
	zDIlD7sHcMoZ/Yeb7comZ7HdDDPfxQ54jmZ1/y7HTgJrsIF7bsfcALjlFtu9RBPP
	Z2kwG3g3Yab6eIYrnTTpGtcEkd/EKfJ4+JUCYryBBDP26/21uUe9MNjPmFQ2VahV
	0LBypX4gOuXXI3+05PUEMxttbNJ9fwWcyOBwQ+3PkjchLiKytPvOrsa+N5wYxr9p
	D/S8K/8hLNoOVV6z6hd/zHrgyALzWsMdcZdnp+8rc+ve2g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0wjnqc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 05 Mar 2026 09:25:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb413d0002so5187343385a.1
        for <linux-firmware@kernel.org>; Thu, 05 Mar 2026 01:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772702749; x=1773307549; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4+mgUbRRkvIPo+Y1k0oP0yfEUJqDnuegGd+SAXexX6c=;
        b=OYx3VNBw9/aTGT/DNQEhvm/Mvee/a/Ax2Ada8UAJHSaIQQ5ht5Na4nCE7mdJG+RSNr
         d95HinK67/M4k0PUAyjVA8jvosJpd99mK88u/fh5MtMeDUvlPSmNWyvseASEKdU+cm+v
         /vWuf81XMg9Qd79SyNQCIYpX0RpxO+fz6iLyTkf/W/NV0cinmqAdVRGWimq/Rs1E/DBN
         Bu7KmsW7g2YAEl1M768QqxnVg7kJvFlBmnE/xeqAU/Mf0aRO2HZC6O7VZAh7SAVZORrg
         n3kktGHhl1lvUX9s63BxW7hfDoCmSwwMUzEMTyJdLNSJBr1SAjp7QnGT1il36nSm/u6f
         qfNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772702749; x=1773307549;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4+mgUbRRkvIPo+Y1k0oP0yfEUJqDnuegGd+SAXexX6c=;
        b=P97qk5NFzbl+wZ6f5K3ZSruzlI5jOSa5e6EPZ/4Pp3xRRU1ZMFBy0rir3oZte4KDSw
         pybPRlhdFWwbrmbHeH4T5OhTYGtIixBUWBl7hx83goAN6EAe241H2F0yXHq5zKsY7nyn
         nh5cvEqSzAZ/HUGyr04fGZXIuXxEa81wSlcLxLyToEISORXWbCBb5Efpp30WP8VpmgMT
         y+uFKy5to0u67xR4p8oRvWE3oXvDdUtQQzmFfejUwHaHpGYO3HLyV4qERtA7V/6JgoKG
         P1Q7pLJUttV+cr5CMk/awk018suNFPCQhHbnK1vzjUC6T6uYx1RUAp1JOt6jAg1w0Tj2
         pnWw==
X-Forwarded-Encrypted: i=1; AJvYcCWMSa3RNAfdrc3Ejig2MetRDQqq8UM4OYc3qg/D9jw4C7xtpmnjhCZICpleXwrcZFnTqjYWcEwM6NatActBSw==@kernel.org
X-Gm-Message-State: AOJu0YxYpIxpILXSsj5uAI9RaZFFX+g742H9B6Voo0RynmZpXhq3wIjH
	6yzoo0KOur5QLulzOVhBIBpljeaDSfPTzTiNw6G/Cx5e2yiRGzcqB66it5nZdnQ0AXhdBBybrEW
	PPdI3Ubj0hoCWHHqfcS1DHhmMUvWrmcnz6SX1ZLuegqmBniLYs2zU4kg6UAp4x/g=
X-Gm-Gg: ATEYQzzxB20mhf/whfITlQfvwnldUvm4u2AVvTeWEsHjOyZczO7bGCFfHKv2imzdEbt
	Zludb0JL79Ly5WbBACKx3mYI7IXHdSMIy+brCH89qX9Ka7ac9OLqpRDigFNIMXqgJrRjMSTaIrl
	1no4xkuElBMBcPj7LeHZtR1jX7ioAgH6D4qiP2FrO+7Ca+pRDbtOjNH5RQwLKrqZn0nszuDFAPR
	qzt5BXHG1EWWiLjiDRI8jO+7iHyuwJdC6n7pFAbRI/WY7r05x9OHmynX+ZWbRFF/QspVx65g85N
	i0c8prZOcmwg+EXL8YwhcCrA2bcfk9FQhAdw05FDrLp4O1EVQ/eHRHl/ik7LOQQfZtj8e82CLnA
	YSt8DX0F6QH9T2zrkJVDoKNce4pJeQjU2KpIWLCIldQvStKDSM1iw1GI/SwQqEQY3FlQ61I3ocb
	MxQYPsuv/ocoDP67ClxFLimrKTJ9X8IdRs3Hc=
X-Received: by 2002:a05:620a:4408:b0:8b2:e3c1:24b7 with SMTP id af79cd13be357-8cd634e8fe6mr177464685a.29.1772702748622;
        Thu, 05 Mar 2026 01:25:48 -0800 (PST)
X-Received: by 2002:a05:620a:4408:b0:8b2:e3c1:24b7 with SMTP id af79cd13be357-8cd634e8fe6mr177462885a.29.1772702748148;
        Thu, 05 Mar 2026 01:25:48 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f2f62d25sm39532731fa.17.2026.03.05.01.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 01:25:47 -0800 (PST)
Date: Thu, 5 Mar 2026 11:25:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Saddam Patan <saddam.patan@oss.qualcomm.com>, linux-firmware@kernel.org,
        kssb@qti.qualcomm.com
Subject: Re: qcom: add ADSP, CDSP notice files for sm8750 platform
Message-ID: <4cdbftr23ksxoyxqzc7ue43wlycpwjepgwmgmcpys2pkqvaq3e@sg6hgctgu464>
References: <15774628-953a-49c0-8a21-543524cbf643@oss.qualcomm.com>
 <sjlerimbkmclb6tmax4jfy7edq73nllotla6oheebiny35jqeg@ungsnspduk5b>
 <5b389c60-d090-4e6d-830e-eb1fb677921c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b389c60-d090-4e6d-830e-eb1fb677921c@oss.qualcomm.com>
X-Proofpoint-GUID: P71x2zu-FV578yLp6ojZ6SjvP3S7T_N9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3NSBTYWx0ZWRfX/st5i8aso93y
 4EGGkkLKKkFp5d2tf949lOLjOpTfcNg2J0j0pfI2fO8clysmRHqHLnSjwu/P22Zrd+3dEAaOECR
 g5nD1Ztbm9cjT5HidHFLZ247GsGXM4CH4APMP7XknaRGzU+RdgGfcDB37VONCaApBqNhVgN4zZk
 qjMwnnSepCskiYB9N1IlJD8RFAbKTLM+SvOoDRDjkAbcj+BAdak92c2EdGu+HG34vwSGaivwXQj
 ZKtKEc4eMmJ+OAobmHYfFFZthjsEhURaO/ZPWxppsBBFJ1Wz2fDD2o6cmWQ/BM2dr7AI8ZuWXLL
 S9XEw4QCOpUl06n2i05pKs5p2AVq/ktKcG/7mGJn98rC9aQnBrrfVQfHAAL4CBQwLmMmmQnd3qR
 UZEcVJcoU0XNbBTgK2l7ViQuqpqU4w6dmqyvaLkp/MqmOWmYX1A5KGAWQAKHiwprAsLQ2AJaUAB
 OCZN9w/zEnqx9huxlnQ==
X-Authority-Analysis: v=2.4 cv=OYWVzxTY c=1 sm=1 tr=0 ts=69a94c1d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=qC_FGOx9AAAA:8
 a=DTrdTKznKA3wwynYdRgA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: P71x2zu-FV578yLp6ojZ6SjvP3S7T_N9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050075

On Thu, Mar 05, 2026 at 02:50:08PM +0530, Venkata Kota wrote:
> 
> 
> On 3/5/2026 2:44 PM, Dmitry Baryshkov wrote:
> > On Thu, Mar 05, 2026 at 11:48:16AM +0530, Saddam Patan wrote:
> > > The following changes since commit f69a5e73c0c0c927a5bea53ce707ef17afae1964:
> > > 
> > >    Merge branch 'audioreach-tplg' into 'main' (2026-03-03 19:46:20 +0000)
> > > 
> > > are available in the Git repository at:
> > > 
> > >    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> > > dsp-fw-pakalanotice
> > > 
> > > for you to fetch changes up to aa05d14567ea5de6790a4ae199b4ab2ab1025fb4:
> > > 
> > >    qcom: add ADSP, CDSP notice files for sm8750 platform (2026-03-05 11:46:08
> > > +0530)
> > > 
> > > ----------------------------------------------------------------
> > > Saddam Patan (1):
> > >        qcom: add ADSP, CDSP notice files for sm8750 platform
> > 
> > It's impossible to comment such a pull request, so could you please
> > send this next time as a patch rather than a pull request?
> > 
> > Also please check the comments that I've left for the DSP binaries PR,
> > and apply the relevant ones.
> > 
> > > 
> > >   WHENCE                      |    2 +
> > >   qcom/sm8750/Notice_adsp.txt | 3214 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
> > >   qcom/sm8750/Notice_cdsp.txt | 1270 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
> > 
> > Are you saying that DSP binaries and DSP firmware have exactly the same
> > set of 3rd party software in them? That's very, very suspicious.
> <Noted> The Notice file is generated for the entire CRM in one shot. These
> are not generated separately in the build for binaries and firmware.There
> are typically dependencies between the firmware and the binaries and in a
> way some of them need to go together and the overlap of dependencies on the
> 3rd party software is very much a possibility.

And I've kept on saying that the notice file should be covering only
those binaries, with which the notice is being provided. Don't provide
irrelevant data, especially in the legal field.

> > 
> > >   3 files changed, 4486 insertions(+)
> > >   create mode 100644 qcom/sm8750/Notice_adsp.txt
> > >   create mode 100644 qcom/sm8750/Notice_cdsp.txt
> > 
> 

-- 
With best wishes
Dmitry
