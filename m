Return-Path: <SRS0=L8DZ=3H=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95812CA0EFF
	for <linux-firmware@archiver.kernel.org>; Wed, 27 Aug 2025 14:07:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6CBCDC4CEF6; Wed, 27 Aug 2025 14:07:23 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 82562C4CEF0
	for <linux-firmware@kernel.org>; Wed, 27 Aug 2025 14:07:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 82562C4CEF0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57R6koGP015246
	for <linux-firmware@kernel.org>; Wed, 27 Aug 2025 14:07:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kx+8JUDCj+fqfZOA2fL2tI5i40SpJg+ugIjUWSs9E7c=; b=P8F3YReZ108Ekcs5
	4b3n+Vun76PIMfLQoo4DE7PCZAz3+wWQPd1uPL2rEiYE9nggsa42mJZ4CbLThqOx
	Q9PXZHWVXf06LSuoTbvl90ZeuarkPu/ShVPVapu39vEgcqDJN0TBOUf36u20wZ2h
	2WNYFqeJHxVakrogwKg21tU2aML7db1IaU9LFKSXmwl97eNAA7SgzDFfxRe/d9/3
	jXwXDMV5VQxaGIFPyVLhUH/nheAMY5CXIIJxKoC0M1DceJnPUAOQhm/k1FiuCLhM
	VI/At1URqj63lcFz+szB2+nSyGhaGjHgHmrVrj4HOVPnqkOhfDvrec65FLYAqrAU
	8AHo3w==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5we4m6k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 27 Aug 2025 14:07:21 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5233781ceb2so664310137.0
        for <linux-firmware@kernel.org>; Wed, 27 Aug 2025 07:07:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756303640; x=1756908440;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kx+8JUDCj+fqfZOA2fL2tI5i40SpJg+ugIjUWSs9E7c=;
        b=VyzVu0m9eTVtNrKoSHnUksKJecm9F3+VZzXlrkclrQWm+9Li31mfYCp4C1esUMEPpi
         IOWq8K8R33ke0saClR6TGjqVAILHtxnnHH+0bowx+E0fdqYhwxVCukesgRa5MsOflgEq
         clWKMCSbvvqkyWyM6nSIKamJcjMxS0fLIKSol/3J8NM3HmExjqoaZaLu6z4+DuLctQsR
         QT4ctXLda/chWwxXs42MvVLae73p8UV92fwi66aja3QxKOHtQANAsaq53YjV5QzIuQwY
         gNzGHlyTq7659XljL8A3eLYYJXtGB4LrSbxmKuqOEpq3UiH/jDqkfyCXWZCJxpZzzQJb
         PdIA==
X-Forwarded-Encrypted: i=1; AJvYcCX68N7O+iYbx+4V15yW1cLqnydCfB/k9YseofEG3LQoWZJVPEyy8rDGavsrDxx/j4WgtjjDEbUlj3zn/c3ELQ==@kernel.org
X-Gm-Message-State: AOJu0YzuCaHZYCiGPnKqLU1yUkoZyj01s6G1NAkHqzSNjJnzSB3p1utN
	SNyOHmP+M9lDAHukBUzUlVkngtKD+nRCDMRwD/dcQz1IrjWhABMvP75AjcekuV7A59YbguepOwQ
	P5w2W7vjF8XvMCHGxiOdSZz/Q3ROUQDKqwX2VPgA1gXmSj5wj3vjmh8wdgdRzhe4=
X-Gm-Gg: ASbGncvvb2AYFvY7mnUI9Oihiz3akvwDqLGLveEceH4sby7xS8S2e2X656Cypif5L9D
	0q1R618T4LS3N7N5o8BBmX2vzPJH0NL5hLZG/1Vl+7RWDBSLD+6nNTvlPQWoPFlewT2oKa/xKj/
	NyS7EAGNujkJvZiR8/CPE4zmtaFMWWsNV9n1JD6Xx7tKk4MQ74XPWOpu113SmrbjZZ04GR/sgUi
	PSazhlJdcMqpG8A4uXhKzmK+h2Wy169XWHviRWOH75ccJaQEgz3equbJtrJxW5aMnfX8B8x7pB8
	lcTGle/85gufpxpb4EzagRgWVSXYd5CabV/ysfE8WWRDAEJB3bfAqmXoN2EoWGOzkOC5mf9YuVg
	ow08tjKc9M27SfDDnLdkXXL9nneFqO/6diKh5r6aYF6zv9OcdWep7
X-Received: by 2002:a05:6102:a49:b0:522:e144:d758 with SMTP id ada2fe7eead31-522e144dc8dmr3295087137.3.1756303640158;
        Wed, 27 Aug 2025 07:07:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnQ7yYa0XSbuzdQyI4FvYze7fOgOWDr31M1KEvvgjhUopC9s3Hk3zvoegkXSnZAxfPY6zEZw==
X-Received: by 2002:a05:6102:a49:b0:522:e144:d758 with SMTP id ada2fe7eead31-522e144dc8dmr3295056137.3.1756303639575;
        Wed, 27 Aug 2025 07:07:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f35c022b4sm2838258e87.27.2025.08.27.07.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 07:07:16 -0700 (PDT)
Date: Wed, 27 Aug 2025 17:07:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Xin Liu <xin.liu@oss.qualcomm.com>, linux-firmware@kernel.org
Subject: Re: qcom: add ADSP firmware for qcs615 platform
Message-ID: <k6o5sa427tokneyu7vhl3rfhgqfxgemx4pjgxi45cf3j2z55z2@zkv743tjqjyn>
References: <783737b1-05fd-41ad-9bbf-8d0e601f3b08@oss.qualcomm.com>
 <cdajgj45c2nycpaprilxq55ke3lgprybsokbaf77apoivdocpw@tea6azhm7lq3>
 <CA+5PVA6+onWZ4u02_W68iRYaSY1rdM3x9_oJXoX_Ws3R_wXXZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+5PVA6+onWZ4u02_W68iRYaSY1rdM3x9_oJXoX_Ws3R_wXXZQ@mail.gmail.com>
X-Proofpoint-GUID: xKdKmBScZhY0vhx3F9e5s6WC-hYeLW4t
X-Proofpoint-ORIG-GUID: xKdKmBScZhY0vhx3F9e5s6WC-hYeLW4t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX+uVgzGTPAsnt
 nq4D+bH8txlxVprFvBhWZKrjmB8/JGEB8G4GPIgJcLcFwNHPIwZnSPl+FwP2+GgY9XI1dbjoBxG
 Yaq/PagslbILDdx1K4wcWswGb/gIM2nloXFK5/WtyRoKoIgGm/h8fPf01Fw3AWUakhcYzuyQn0+
 jMHwhuUuwLB69JpUqLAXTTBXOLOa1Gun8HPQ3F7eNti3BCzP9wm+NPBS1Xmb/J4/ViDlME7RH8u
 CzeeOmw6kEr3fsZHqf3VIqE5+CEWtcxJ7/gnHM5dWtkdHu0QxZlX+ruhUnI79+bCRZHW8CvJsut
 TWdhNEwXIQh8PwJ4M4KJSkluxpfH5Qwsg9HxQR1EcOj2FONdGFPeqybmlT0+hbnQ0oXVTpge3z1
 QWXt18iR
X-Authority-Analysis: v=2.4 cv=BJazrEQG c=1 sm=1 tr=0 ts=68af1119 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8 a=qGtUbBMlfYlbQpkegS4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_03,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230033

On Wed, Aug 27, 2025 at 08:52:51AM -0400, Josh Boyer wrote:
> On Wed, Aug 27, 2025 at 7:53 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Wed, Aug 27, 2025 at 10:57:12AM +0800, Xin Liu wrote:
> > > The following changes since commit f044bc789f8e7a4427593b687801644c39e3e8b7:
> > >
> > >   Merge branch 'amd-isp-staging' into 'main' (2025-08-25 18:22:13 +0000)
> > >
> > > are available in the Git repository at:
> > >
> > >   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> > > qcs615-adsp-827
> > >
> > > for you to fetch changes up to 542611790f77a67a6a24c08d087d22585caa5ac2:
> > >
> > >   qcom: add ADSP firmware for qcs615 platform (2025-08-27 10:46:24 +0800)
> > >
> >
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> Fails check_whence because the files have the executable bit.  Can we fix that?

I'm sorry, didn't catch that up in the review from the web page.

Xin Liu, why are you sending a pull request which fails the check? Did
you run 'make check'?

-- 
With best wishes
Dmitry
