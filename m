Return-Path: <SRS0=C38d=54=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB244CF64A0
	for <linux-firmware@archiver.kernel.org>; Thu, 20 Nov 2025 01:03:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A5D77C113D0; Thu, 20 Nov 2025 01:03:46 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9E828C4CEF5
	for <linux-firmware@kernel.org>; Thu, 20 Nov 2025 01:03:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9E828C4CEF5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJNEiw63062730
	for <linux-firmware@kernel.org>; Thu, 20 Nov 2025 01:03:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Z5jGBp32eO11k8g3bFEn5Wk3
	52tAtw15FbW22x/eOTo=; b=l3GbOakyK0XnMheDGaLoPIsLuIB8lkVuXVSxLkpX
	D5cwiDayJtb7Vmt88ux5yxyq+i+XCKMWAtFiNeZFYOcTHqL19Jed+5RXGcdteg3W
	oUyxnF8o2Cf6jJtDi/a4wP6Ac1njy1jEEZ0Ayp5hVdLzGCJ0q/wFAkBv1JglvKKr
	H062VkpRXHZ1Z5HlwPspMlORG56r27Ku1GGOI5mly1RqrcG2MU0WRzUFBJSD1kYO
	fKLn9zxUZmPtA37xCJWbtq4YZFzaCTdLeJ5WofAFkcGL1lHo4ME91eQpTCsPgZzg
	raqtSHISAqhz9FGSt/hlrJKMbYQGVhbqo2TshxAoKRS0fg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ah65t3keg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 20 Nov 2025 01:03:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2dbf4d6a4so118990085a.2
        for <linux-firmware@kernel.org>; Wed, 19 Nov 2025 17:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763600623; x=1764205423; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z5jGBp32eO11k8g3bFEn5Wk352tAtw15FbW22x/eOTo=;
        b=TOjaSJKA+oMEl/k6y0Hq1A3Uibpzg9dOl6Ckv4P3ldAHROVqfs+EeStBbvyB05SMMy
         Yyoy+hzOrr6VIBj9f0MBZ3FIxiXpI99MRCQbE83t6iBWB+6gQYdeMfdkWCkcRxM9RUME
         fu5vmAp9a1/CTyqs8Ohv11LMGwg8t5U9QzjwAjpFeeFqN/1ECngHWmHsrFwNR8Rn4LFh
         JkpNeogH5eY5wkRpqyllnJAupinRh0HylbqkjWYaT6PXR8scjuPNosl6DxWMUrZIML3x
         /ctNAz3NObrF4Vx1DIZq8JhWSkYs0EC+86mYx5Pxq8qtJeBgBPeN0SfWWbvuWXD7/fAw
         aqXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763600623; x=1764205423;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z5jGBp32eO11k8g3bFEn5Wk352tAtw15FbW22x/eOTo=;
        b=lFeddFbZFt1T0nBa42Rhc574QeGpmvMOLRiCsisuSy8drMev3TtUvZXRYEHReBpxuG
         NAhLn7ebQ8GRUidHoOIGdUuoSL/nwydTkK0gj1mE7QxIw+Zzw8WyexusiwDflZFMAhy9
         N06kYO/KKEgoMUejFTwVMMfdfiPHJ2wP2GGbgRqHUx6ekphrx/ePpwG5TCiBlgWFtdQx
         uAXb0b/LSb4CmdGz8C8urQy1s9QeiHQUU0SlxXE2ylWrbMs9lt6r/76gUV2GZFtWsg3o
         F5RefEY8py3Fo5fKQcSAmYAKb73KFZmVZjX4Je+q14P/OE0IoQlFQKxflmiYt64BlgAB
         9McQ==
X-Forwarded-Encrypted: i=1; AJvYcCWG12P7bzqs7ZUPMbN146FRiGAWxz8RvVRLiRkp0ZFSKhoHcqiYnDObqqGo7PUEwo0aHBMlDg/Bddp2dCyw0Q==@kernel.org
X-Gm-Message-State: AOJu0Yz3F92SHuSjuwrdBrW1A0pmfl/aNjBHzHwM6umNxPuASAcWn7dj
	5qkjuSlRaIu/76CWIEjCfxOh1kOEnT2/vQBXgFR1osl4KlmrtgM8nldYmSy+AUOzPnjacjOY5A1
	F9DwW91LQDCIOw2jc+eTJ0rY9mBXfcD/iknujiKnSzNDogDC2dy4NAKRI4dYt0Fk=
X-Gm-Gg: ASbGncuaY7NqCDDJV/KFlGgPTA43lNbyIzh3tFomX5EEcYnO3BOQZibdE5dq8vxZQg4
	53nceW7W/3za9KiU0gteD81mrcPAvWIUcgCNCaaJxZiPhTna7OvfxH7GsdWfvjnKLu22tX2KXZM
	ze7/pYGo2E7fO5ZUTLmKCnb8a1GmikcmCUS19Fgnu4C9FLQlZQDb041uOVVnNL/SxRmisrPMDS3
	YNKMb0FdunVXZDG9p3Leky/sQBkkFacVl3LiQ7MDkVDMD0rd1Tx/T0sS20zzaOF7KNsRbFDFw1Y
	CBXoQ0r//ldQ8OJ24IzrlGPcJXivsdZWeLU7I7xfua2u5i1vib5DCUod1py32QfoSg5OpEMZyHg
	sVx7bilSlcg5muRjypwRXxDzhJygYxzKLg8WZLaJp+/0kmB96Nqrb8vHewi7xWaaP6lUtCYD1Je
	7wjbGMN9W4yroC52ru7jTOYOA=
X-Received: by 2002:a05:620a:2915:b0:8b2:eefb:c8a6 with SMTP id af79cd13be357-8b3274afe3dmr198557185a.88.1763600623439;
        Wed, 19 Nov 2025 17:03:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH8Pbq7FKAQY9eQhx/yzUI365YDRbuEIyx8/zsWYDe5LkxDIaKuhJtFgPAG42tknlCNzHE7+Q==
X-Received: by 2002:a05:620a:2915:b0:8b2:eefb:c8a6 with SMTP id af79cd13be357-8b3274afe3dmr198554185a.88.1763600622964;
        Wed, 19 Nov 2025 17:03:42 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbccd9esm233499e87.92.2025.11.19.17.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 17:03:41 -0800 (PST)
Date: Thu, 20 Nov 2025 03:03:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Renjiang Han <renjiang.han@oss.qualcomm.com>, linux-firmware@kernel.org,
        "Qiwei Liu (QUIC)" <quic_qiweil@quicinc.com>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        dikshita.agarwal@oss.qualcomm.com
Subject: Re: update firmware binary for v5.4
Message-ID: <lp6zqc63rznqakiyixdjnzwlaesvoelcmbgrxosq76ijufuj5f@gtwleb2fz6hh>
References: <d3442fba-a616-4260-a2c1-bf14d0d64250@oss.qualcomm.com>
 <jlnmauqconyiaujadjrffjeqbzkc6pa7vrcmnjyueuuamfguhg@ln43yypqrvoq>
 <7111892d-1351-4c94-82f0-8566c34f16c1@oss.qualcomm.com>
 <jodkivawdceoc7ebzm34w5ocipnv7zpjvasadyha6kdpayluja@255mxfp4eq5f>
 <1a8feea5-e797-4a19-a1d8-e4d5d5bca0c9@oss.qualcomm.com>
 <iznnjuldjlzscbasoxxwgemtd37pemtpo37dw2q7fj3pfct5y3@iepxxugydewz>
 <1db4c5a7-74f8-44e3-bb56-cf075e4391bc@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1db4c5a7-74f8-44e3-bb56-cf075e4391bc@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=avK/yCZV c=1 sm=1 tr=0 ts=691e68f0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=x3Mi2VbTIKCd7kZIgu4A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDAwNCBTYWx0ZWRfX03/l6wjhGmyH
 gKTD8z1K+JU4DdR6zDas4O6sM+upUSE0ow/Z36no3sCkQAkMEScYAhPxYmsjyAoSIgRYIP5ZJeC
 07eTsanaeLlSJp+M4feUGhymeqD2pvziZkUX/Litd3/MXdphnbjudX9kT9HMV4TTSUw1nm0m0ma
 2L/GpTuYO06Yr1XGW7gOYBMkTBGyKRag3H0DAydlQVEcMUPpV73oWuFHBPDVuPylCOFRcHK09v4
 DfMVAmsl/7m9q8WAvOJljlBzJ1esjcidfXPtVRRjRAUlvsAeCWyYUrYRhzOw2ktdZHmstMZsxWa
 6Xb6EjJFLQw6GUA4Cc0GuDmdd+emBR6k821bAeHq8h+3icl8xnFM2AZb/NH/dAQhdIfRhXcHjky
 2pyzdr7vXHtdsNct5GcyvO8cmiRQCA==
X-Proofpoint-GUID: lbuumX-zVD8auhFqs3WHgwdL5nd7-9ZA
X-Proofpoint-ORIG-GUID: lbuumX-zVD8auhFqs3WHgwdL5nd7-9ZA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_07,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511200004

On Wed, Nov 19, 2025 at 10:43:14PM +0530, Vikash Garodia wrote:
> 
> On 11/19/2025 10:10 PM, Dmitry Baryshkov wrote:
> > On Wed, Nov 19, 2025 at 09:49:17PM +0530, Vikash Garodia wrote:
> > > 
> > > On 11/19/2025 8:22 PM, Dmitry Baryshkov wrote:
> > > > On Wed, Nov 19, 2025 at 07:57:30PM +0530, Vikash Garodia wrote:
> > > > > Hello Dmitry,
> > > > > 
> > > > > On 11/19/2025 4:55 PM, Dmitry Baryshkov wrote:
> > > > > > On Wed, Nov 19, 2025 at 05:39:43PM +0800, Renjiang Han wrote:
> > > > > qcs615 while venus.mbn would continue on sc7280, but then we wanted to use
> > > > > same bins for sc7180 and qcs615.
> > > > 
> > > > What is the status of the current venus-5.4/venus.mbn file? Does it work
> > > > AS IS on Talos EVK that is being in process of upstreaming and on QCS615
> > > > ADP AIR aka RIDE boards?
> > > 
> > > @Renjiang ?
> > > 
> > > > 
> > > > > S2 variant can be produced now by re-signing this venus.mbn itself. To
> > > > > achieve this part, there were some elf alignment fixes, which is done with
> > > > > this bin to make it re-signable with any vendor specific #.
> > > > 
> > > > I thought that this already happened for VIDEO.VE.5.4-00060-PROD-1. What
> > > > is the difference between it and the new one?
> > > > 
> > > 
> > > VIDEO.VE.5.4-00060-PROD-1 had ELF 4k alignment issue [1].
> > 
> > Commit 891a8d4fdfef ("qcom: venus-5.4: update firmware binary for sc7180
> > and qcs615") left me in assumption that at that point the
> > qcom/venus-5.4/venus.mbn has been working on QCS615. Is my assumption
> > incorrect?
> 
> Both #60 and #62 works on QCS615, while if any OEM tries to resign #60 with
> a different signature, they would not be able to do that with #60, while
> they can do that now with #62 with the ELF alignment fixed.

The commit that I mentioned had 0059, not 0060. Also, if the ODMs can't
resign the binary, how could you sign it?

Is the following correct:
- 0058 works only on SC7180 (does it work with the SM6150/Android?)
- 0058's venus_s6.mbn was signed with MBN v6 to work on QCS615
- 0059 was updated to work on both SC7180 and QCS615
- 0060 was uploaded as 'yet another binary to get it working on QCS615'
- 0062 now it's another binary, which works on QCS615 and can be
  resigned by ODMs

Is that correct? If not, then your colleagues need to start writing
better commit messages and being less shy about explaining things:
I basically wrote the summary of the commits chaning qcom/venus-5.4.

And if it is correct, what was wrong with 0059?

> > > 0x34 % 0x1000 is not equal to 0x0 % 0x1000. This part is fixed in #62.
> > > 
> > > [1]RuntimeError: Program Header's Offset, 0x00000034, and Virtual Address,
> > > 0x00000000, are not congruent modulo the Alignment, 0x00001000. (Offset %
> > > Alignment) must equal (Virtual Address % Alignment).

-- 
With best wishes
Dmitry
