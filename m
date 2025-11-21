Return-Path: <SRS0=BA+5=55=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4343ECFC268
	for <linux-firmware@archiver.kernel.org>; Fri, 21 Nov 2025 11:56:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2DE89C116D0; Fri, 21 Nov 2025 11:56:31 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 54754C4CEF1
	for <linux-firmware@kernel.org>; Fri, 21 Nov 2025 11:56:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 54754C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL9VwDp3048104
	for <linux-firmware@kernel.org>; Fri, 21 Nov 2025 11:56:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xFZi1vlN2uJt9akmEdMudxqy
	ny9rXVCPsy35rrt8g2c=; b=UzQOEmieNIaSmSHMrFwgmlyem0HjgOVvz45ko6If
	U6mIdp674RKIo2sbkYk9a32MmUl7bWsc7xCfEo2QtshpSTKYj0GLznfbcVxvk/F8
	mz6ltceALvMti5rO6dwze9J4cmbeGIPHYOrIUPViU89zPCsVK3JfBxNLOo2x3M2K
	j7HOpHySUV8L+aYfQ8R8/qh9zZxZHcSG4QDRAAUufvz2i/RkHe2JjeDduzS+Yu7h
	Jvza9QRAX6Qsm8RYAz027psWjtw7q9Hu17V3gJPVg5gpFeio0VrGLbPehpcKItep
	1PlEtns2I5zIJOglBnmdQTD6NTsskVWnXBT+bR8pdc0HYg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajnhjrdv7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 21 Nov 2025 11:56:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b26bc4984bso816229385a.1
        for <linux-firmware@kernel.org>; Fri, 21 Nov 2025 03:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763726188; x=1764330988; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xFZi1vlN2uJt9akmEdMudxqyny9rXVCPsy35rrt8g2c=;
        b=ej1KbLq8+0jil/Vto5X0RiEY4FzRAxpFga+SEEcOdqGE/q3NPdttkl1QIRql+Dv2Mn
         BpcIz8D91HZOJoOhUpoum04zPo/7bKBBdJmRmSOhvoYyEsu4o/NPPAsFr0odklkO0VJw
         Zhctv5FXlB37NWpxm2CdOst6/w5eynKo2P8oginXqu/p3bO/FYL/H4Cne6DIXQ/jycfc
         CB3KMVbiihggwcecVrSKhFCe4LBe9zVDI1JpXyRtOhgGUsKj7OQThETdgsOTwuSAV2uw
         WUMCMx2F7RwMEVj7QRcsPxndztrc/UjmvFUmN76AeNf9a2uP4zX/7/ziOGj0438tqEky
         T6rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763726188; x=1764330988;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xFZi1vlN2uJt9akmEdMudxqyny9rXVCPsy35rrt8g2c=;
        b=fBlavCmY4UK7ldszTGsQDq8sqo4MDa1/kehb3y4RJqK/w536+xTTeJjUpOkzfGT4qA
         zYv9aPQ+IB8iy9MNxcUBSg0i2VU0qWJRixTIdXXyrYUAlKzyhIsg29vQKAms77fZFbQs
         C3QKhC+Lm9RESkB/dcQIroxU9Dr67rWyaFZAWRMVQTyfeZgQabLYtGDyN/6eJYMzOkmi
         UnqddJI6fjrFJqTmVswVtWq6PnPoP12XyyMWsLsSshlbax51i5OHMmfeI78Dz4XvJK+f
         YsPnvVYP8VG+lVfC/smY4oIBeujbguX2xYZIJ3Sbb+ta43w6sR7Q0P08xplBCJgkZ5r0
         Oypw==
X-Gm-Message-State: AOJu0Yxx+wTPSlTTWd7VzpPCI7eT7Mzp8QJEqHOxTNUyxr6ISdFtvMyp
	rLxcA2TWtLsQEvNEhSOJkYFvOKOuiXksoU70eppoCQKl0fVd+ISzrwf6em0N39bsuwb//GdI6bc
	9TVRbCmXagpxC2NlkoREZqCHCqhzri1eS7X0Ynw3U6gKBKorE/+zkNSAMYJAAgAo=
X-Gm-Gg: ASbGncsRo0foV4nMQlHEsH7Z6ybCCxn6GJD+vsMSubm+aHEsoVBhXo4M0TQcRCoR3mN
	qQctcwqNFSiUDY/wcKEiHFijlk0TVXY3Zfw7D7OZscM6TCAI1IZ58980pCmijoDoR9mfuzPpxJj
	FxRvU66GDJkK3UxDJClESgm6g1i8IpuaeVIZuEj8MdfEpPBrEJd3vQfHewADWTwLYdw6zm9GVP2
	iWjlmmeV4A05IB8VEURPwD9kLzCQNHMoJZd1ebwGQatu2XwiM8qaQ3FssG8oEENF7vp5bQbTIwJ
	yX5XFSaei8MMbIvPgrRwgRshW0Eizi4MBqckdx7Q9EJVoNlskUBOjE9mxE/OydzK8Z7ZnV72P32
	KtoVk0PMu66e4s6Y5poCFTDB1v7QDFNgF8edVSANSpjJeUw2q9fpQjtvS8/xIucWATE6nFzdyic
	RoQ7a0K9yFjaqyT+QdoFIwDp8=
X-Received: by 2002:a05:620a:290a:b0:8b2:d791:3d25 with SMTP id af79cd13be357-8b33d203a62mr186492685a.18.1763726188305;
        Fri, 21 Nov 2025 03:56:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHMJmqa1r5XVW8PY7oiEf8ms6Ro7Y2ijbiULnymvkcXD0i8ONNds/Ci7PFhG5ZRZms70AHt7g==
X-Received: by 2002:a05:620a:290a:b0:8b2:d791:3d25 with SMTP id af79cd13be357-8b33d203a62mr186490285a.18.1763726187826;
        Fri, 21 Nov 2025 03:56:27 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbcd225sm1581691e87.93.2025.11.21.03.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 03:56:27 -0800 (PST)
Date: Fri, 21 Nov 2025 13:56:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wei Deng <wei.deng@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, jwboyer@kernel.org,
        cheng.jiang@oss.qualcomm.com
Subject: Re: [GIT PULL] QCA: Add Bluetooth firmware for WCN685x uart interface
Message-ID: <tcwroapnfzfi4fhrb6sa63fvljo7lxyhcldoly4as4p4g4lgfw@6lfxzplkxikb>
References: <5fd2de28-2bd8-4dea-9afe-0cd7a5d9c9a5@oss.qualcomm.com>
 <ylctfzbgxpnbitgxk2mwpw6aptdzyedscbvwm4dzsew2sskdal@tlyyv5bulpzi>
 <73738c07-eca2-4065-8e3c-3bb68e8f291a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73738c07-eca2-4065-8e3c-3bb68e8f291a@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: UVjEi9hhBbXQc_y3y_UmwGcgqoLj3Fwx
X-Authority-Analysis: v=2.4 cv=SPlPlevH c=1 sm=1 tr=0 ts=6920536d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=9RLuniW85I0tsJXTCVUA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA5MCBTYWx0ZWRfX7Dl5bvz4F392
 HwpMYXgB0Pp7NvN00qkHN6T3l3NUHSjAU8m3PSDu5qzGmv3sMCqwJSrKkw+IyAzPEnbjco05IM7
 podAUuhZq/44TMihsqkDCuI83ZODTyVdCON2kGGkkd9ty43Ug+uDozlAdzENyxhOAN+7XIZth+I
 zyyaAnL/rtCdQZ2h9o8+AFsKF7Df3RomkuBaNMmNXowmhA/KtPxLO99ozVomGr1TjOZcvMItCd+
 CLJHw3gBS4B2lQxMNCWlCkfIBGnbnZBadRGZf9JrQhDzpJwdnnEM53Y+mj9nil8kloSzmvVFgAR
 RGcoCIZ3IJoMWvlmZGSyAkdWbpOGtqavEbuiOkLwgJLflOwOIZkZg2m/TsvfR3p4fXEs8qphkn7
 VHOhmj1xq6uNWLLZKkuU5g+gWYl0bg==
X-Proofpoint-GUID: UVjEi9hhBbXQc_y3y_UmwGcgqoLj3Fwx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511210090

On Fri, Nov 21, 2025 at 02:50:10PM +0800, Wei Deng wrote:
> Hi Dmitry,
> 
> Thanks for your feedback.
> 
> On 11/21/2025 6:29 AM, Dmitry Baryshkov wrote:
> > On Thu, Nov 20, 2025 at 12:19:21PM +0800, Wei Deng wrote:
> >> Hi linux-firmware maintainers,
> >>
> >> Here's a pull request for btqca bluetooth driver. Please let me know if
> >> you have any problems.
> >>
> >> The following changes since commit 8b9fd78478acacccd0cde109b4a3550969f33bbb:
> >>
> >>   Merge branch 'dsp-fw-kaanapali' into 'main' (2025-11-19 07:22:57 +0000)
> >>
> >> are available in the Git repository at:
> >>
> >>   https://github.com/WeiDeng-weiden/qca_btfw.git main
> >>
> >> for you to fetch changes up to 94beae96027761e69a54603605b8a9bfd7b71b3d:
> >>
> >>   QCA: Add Bluetooth firmware for WCN685x uart interface (2025-11-20 07:24:50 +0530)
> >>
> >> ----------------------------------------------------------------
> >> Wei Deng (1):
> >>       QCA: Add Bluetooth firmware for WCN685x uart interface
> > 
> > Please don't strip parts of git request-pull output. I'll add it back
> > for you:
> > 
> >  WHENCE              |  39 +++++++++++++++++++++++++++++++++++++++
> >  qca/wcnhpbtfw21.tlv | Bin 0 -> 152784 bytes
> >  qca/wcnhpnv21.301   | Bin 0 -> 6876 bytes
> >  qca/wcnhpnv21.302   | Bin 0 -> 6876 bytes
> >  qca/wcnhpnv21.309   | Bin 0 -> 6884 bytes
> >  qca/wcnhpnv21.b10c  | Bin 0 -> 6618 bytes
> >  qca/wcnhpnv21.b111  | Bin 0 -> 6618 bytes
> >  qca/wcnhpnv21.b8c   | Bin 0 -> 6610 bytes
> >  qca/wcnhpnv21.b9f   | Bin 0 -> 6610 bytes
> >  qca/wcnhpnv21.ba0   | Bin 0 -> 6610 bytes
> >  qca/wcnhpnv21.ba1   | Bin 0 -> 6610 bytes
> >  qca/wcnhpnv21.ba2   | Bin 0 -> 6610 bytes
> >  qca/wcnhpnv21.ba3   | Bin 0 -> 6618 bytes
> >  qca/wcnhpnv21.ba4   | Bin 0 -> 6618 bytes
> >  qca/wcnhpnv21.baa   | Bin 0 -> 6618 bytes
> >  qca/wcnhpnv21.bb8   | Bin 0 -> 6610 bytes
> >  qca/wcnhpnv21.bin   | Bin 0 -> 6610 bytes
> >  qca/wcnhpnv21g.301  | Bin 0 -> 6716 bytes
> >  qca/wcnhpnv21g.302  | Bin 0 -> 6716 bytes
> >  qca/wcnhpnv21g.309  | Bin 0 -> 6716 bytes
> >  qca/wcnhpnv21g.b10c | Bin 0 -> 6458 bytes
> >  qca/wcnhpnv21g.b111 | Bin 0 -> 6458 bytes
> >  qca/wcnhpnv21g.b8c  | Bin 0 -> 6450 bytes
> >  qca/wcnhpnv21g.b9f  | Bin 0 -> 6450 bytes
> >  qca/wcnhpnv21g.ba0  | Bin 0 -> 6450 bytes
> >  qca/wcnhpnv21g.ba1  | Bin 0 -> 6450 bytes
> >  qca/wcnhpnv21g.ba2  | Bin 0 -> 6450 bytes
> >  qca/wcnhpnv21g.ba3  | Bin 0 -> 6458 bytes
> >  qca/wcnhpnv21g.ba4  | Bin 0 -> 6458 bytes
> >  qca/wcnhpnv21g.baa  | Bin 0 -> 6458 bytes
> >  qca/wcnhpnv21g.bb8  | Bin 0 -> 6450 bytes
> >  qca/wcnhpnv21g.bin  | Bin 0 -> 6450 bytes
> > 
> > And I've added it because I wanted to ask. Why are adding both files NV
> > ramdump files with .NNN and .bNN extensions? The former ones won't be
> > loaded by the kernel.
> > 
> 
> Thanks for posting the complete request-pull. Uploading .NNN and .bNN 
> files is to keep them consistent with the current UART interface NVM 
> ramdump file, we update same files with hpnv.NNN and hpnv.bNN.

Again, what is going to load or use, for example, qca/wcnhpnv21g.309 ?

-- 
With best wishes
Dmitry
