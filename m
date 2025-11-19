Return-Path: <SRS0=qm9z=53=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66935CF34C1
	for <linux-firmware@archiver.kernel.org>; Wed, 19 Nov 2025 14:52:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4F60BC2BCB5; Wed, 19 Nov 2025 14:52:17 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 18EDEC113D0
	for <linux-firmware@kernel.org>; Wed, 19 Nov 2025 14:52:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 18EDEC113D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJBj9pq537184
	for <linux-firmware@kernel.org>; Wed, 19 Nov 2025 14:52:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	urJEgxa3JjE7rSXL9+yAwvfv0DCB+pOv6UE8U6upnX8=; b=o8qiYGXOGVStshgl
	cxJ67WysOluGNlnMYLfwuqOOETZ75xoj3N14Oy6s7SRuCscay+aMHAeYnKlCqj1d
	Y6ss26rhNa8cbhGp7bmJ9xYPvnLJy1VNP/aJjPeWqxxcamm7GlCI53HY+FzPe6DD
	71x6YLPCrWZnZxy9emnArmlHpmH1Ad8/A86mNyGFFaNb8VSIqep/12mtJD3XZvF+
	oKs4XvsIXAIPLfkUqMgV68Nsp97GQaqA264eX7PY8kcb8X8H4gHjWzxlgLDAEe1h
	CUHSbnHxCIK1mbu7OyuYV0jq+lZgyHtgeLYaM98JTC38KOr6sXx51r55Z+j82dQq
	Mgxlsg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ah65t1vv0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 19 Nov 2025 14:52:04 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee0488e746so22717651cf.0
        for <linux-firmware@kernel.org>; Wed, 19 Nov 2025 06:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763563924; x=1764168724; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=urJEgxa3JjE7rSXL9+yAwvfv0DCB+pOv6UE8U6upnX8=;
        b=RG/SA+GCBwItrpjDHy6tlDH7/WevxNpq+8crxeeJgkQGdVSS4dZWcwSQ8Di/wiLt11
         4GE+/QQUzBx2AelhJ621U0gq/Gp+wzDWn+q+qfBFAaGujchm0ZuGphlJef0Ortl+aSJB
         eheZ6CyrAiWjUBilhr7YphtHazQoYX/dt4eETt8XJEovtjRY8ct+Ni7pFpXnQYVADauM
         jYi7tJlmd8Ir4S1k1riiLUUhtd1+oJHuUy1hC2T9HTIB97rZ4apXOSiE2bBgzRa20fDc
         usBmLfxoQfPtsOXLiUvbRXwJ5CDGeV1JOPAKeEMPFGicSUD9N1GMzOUfM9jRvdc89BUb
         kgwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763563924; x=1764168724;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=urJEgxa3JjE7rSXL9+yAwvfv0DCB+pOv6UE8U6upnX8=;
        b=pjFNogxpgpD8HArqy928ZZ7XQv8ibdF6k6+ivJhtlQrY0lbHGJcOzCtbUw1qWB3Hy+
         oINCRWmcP7LTPhnHLneLgHzeFvlwxmR8xerEBfh5ryone5Wb4JUwZaTYxn+nIvz4vOAV
         vPXc18JDlAKCWc5sVUmiXihA6OxD3R+r65zMWW85L3WGoOqJwMTxkWcik90vaaK3jh3m
         pl1Q1M2paVeueWmgh6RThEZ+QexTn9hcgWH3ntVCsYzWS3/RBsuvJmqdgLrL3o3E1fXu
         2KH3c0cFz0bgVYeNnGWlCfVYAOGOxuHjW6Oo1HKgG+XdRgxgu9z9pE97jlEX11tUeJVb
         j8UA==
X-Forwarded-Encrypted: i=1; AJvYcCWkdx0dOauhXY0pSadikH/juwm/R42J+KGJHGLIENSYkRf4oIYGif4/o+wGLuWXcwIyYtFqMfcQJB7NFQU1mw==@kernel.org
X-Gm-Message-State: AOJu0Yyx55XncdP6ImoJq0/CPuoIkRm2DLt4BHHLlO36nzv+OUk45p+3
	IYCPGIJ2ahXwUo+x1wxZMe1dTA7mxH/Ha/rYJU5CDigdESJ7HE9LP9FmhobLi5vAOdez4RUoL4R
	xdrp8hoz22lL5cJhtCkX/b71ukJ4J7etcQK0zriZTX46ITvkLwiETCq4fOeKUoGipdeGqeRM=
X-Gm-Gg: ASbGnct29qGDUshTUxKWN9QL0P0WKZvb10PAcYsqJBD5toKmO+dKJR5i8YKX1v+mtwf
	w0fBF9KA5NC90vK1Vl39WbvGczXmqTPo/IVLPWD9boEGn6OLcDx7IMEbtnfv4ZwBOB3cKmAKxw0
	w5u+KjS7bQ3UTWbkEZfDFNuDVKpHErbIAGLrziiBKDnppIGMXwHL6Hj1PUFAcvMghJ4QPxVhvB3
	97z0I4zF0qt09Su79DcqYmEp6GnTCCAg5Rzk1r37kF2dHagB5yLx35LQCZtrrlQwkSwvXVkwCKP
	vOaHLM+62eSHmpMPc07mXbwrYrwQUscAuvQt7AmBWa9nNJzYLWDtfT2iXU3QsuGUPKm3+raTKfa
	fHMjP1qVw7v47WL0m2fKXb2sRDkz5jJG4j8NBzeBYiMKYW5Y1Y7rNWYvSdYYalKUFb3KTKDQyhB
	JVLpMUja2MJnfy33cHGf8ViWA=
X-Received: by 2002:a05:622a:14b:b0:4ee:2845:40ec with SMTP id d75a77b69052e-4ee3fea1ec6mr33540871cf.30.1763563923588;
        Wed, 19 Nov 2025 06:52:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFzrlZ78bbFUEWnQEeZOtDvRfZF8pnuz2OS+kqU1SMTm4ViBchSwOOH7hdhWmai9jDKBm+P3w==
X-Received: by 2002:a05:622a:14b:b0:4ee:2845:40ec with SMTP id d75a77b69052e-4ee3fea1ec6mr33540371cf.30.1763563923053;
        Wed, 19 Nov 2025 06:52:03 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803b42fdsm4786463e87.38.2025.11.19.06.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 06:52:02 -0800 (PST)
Date: Wed, 19 Nov 2025 16:52:00 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Renjiang Han <renjiang.han@oss.qualcomm.com>, linux-firmware@kernel.org,
        "Qiwei Liu (QUIC)" <quic_qiweil@quicinc.com>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        dikshita.agarwal@oss.qualcomm.com
Subject: Re: update firmware binary for v5.4
Message-ID: <jodkivawdceoc7ebzm34w5ocipnv7zpjvasadyha6kdpayluja@255mxfp4eq5f>
References: <d3442fba-a616-4260-a2c1-bf14d0d64250@oss.qualcomm.com>
 <jlnmauqconyiaujadjrffjeqbzkc6pa7vrcmnjyueuuamfguhg@ln43yypqrvoq>
 <7111892d-1351-4c94-82f0-8566c34f16c1@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7111892d-1351-4c94-82f0-8566c34f16c1@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=avK/yCZV c=1 sm=1 tr=0 ts=691dd994 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=qC_FGOx9AAAA:8 a=2UGYnrIuqfXv9HCVxi4A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDExOSBTYWx0ZWRfX49cT16Ewj1nL
 t1iItxd7Rc98V6bD7+W3/KJiteTQWktLQlyEXzPtQm5pa1Fu5HR3TTKZpdvYz5JUq2AGhQB7d3E
 +iQ+/GPBR4tQuaQNsM4pAbxfG/M6sOxpJ4b8V8WszBCUL9783gCVUDdTwUoRDTNksSfUHHmJOb9
 +75jpeQsUTDDSKD3N6vhg0uzfBdTPNq6ZwnZevRsLwIvJn/BoG7SXRe+eEEPZJblQHSPYOKhqLK
 nRPZbdXReqX5mHHDgKFJTcVX8F8wg6giIlzBosH4/vLNCfd59mNgmSnZqRVoA0Mxmo3BDwLMM5+
 aGCz87kzOUqBmm//cRKVqc16xKr4dijpCEnEQclERVQXIRIxT6bNLLq/2UvSxrjsllihLERmepN
 btnmCMVZ/kbme07+u1GGaFYf+OH6Zg==
X-Proofpoint-GUID: f1elflbeNev5G2wEPBU6sWz4pnw2e30a
X-Proofpoint-ORIG-GUID: f1elflbeNev5G2wEPBU6sWz4pnw2e30a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_04,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190119

On Wed, Nov 19, 2025 at 07:57:30PM +0530, Vikash Garodia wrote:
> Hello Dmitry,
> 
> On 11/19/2025 4:55 PM, Dmitry Baryshkov wrote:
> > On Wed, Nov 19, 2025 at 05:39:43PM +0800, Renjiang Han wrote:
> > > Hi
> > > 
> > > The following changes since commit 6fc940781a013ad837ed8fea326d2b897467bbc3:
> > > 
> > >    Merge branch 'robot/patch-0-1762826844' into 'main' (2025-11-11 12:02:02
> > > +0000)
> > > 
> > > are available in the Git repository at:
> > > 
> > >    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> > > update-video-fw-sm6150
> > > 
> > > for you to fetch changes up to 0a6f987b7b07a6fec2d4fd42ac4473c0523d3af6:
> > > 
> > >    qcom: venus-5.4: update firmware binary for v5.4 (2025-11-19 15:04:09
> > > +0530)
> > > 
> > > ----------------------------------------------------------------
> > > Renjiang Han (1):
> > >        qcom: venus-5.4: update firmware binary for v5.4
> > > 
> > >   WHENCE                      |   6 +-----
> > >   qcom/venus-5.4/venus.mbn    | Bin 922216 -> 922312 bytes
> > 
> > And this firmware file is also going to work on SC7180, correct?
> 
> Yes, we have got this validated on SC7180 as well.

Thanks for the confirmation.

> 
> > 
> > >   qcom/venus-5.4/venus_s2.mbn | Bin 919008 -> 0 bytes
> > 
> > Vikash, Dikshita, could you please comment, what is going on here?
> > 
> > We have added venus_s6.mbn, then dropped it, saying that a normal
> > venus.mbn can be used on QCS615. Then Renjiang added venus_s2.mbn
> > (why?). Mario merged it despite my NAK, but that's a separate topic.
> > Now we are dropping it again.
> > 
> > The firmware is the ABI between userspace and the kernel. We can't
> > randomly add and remove files here.
> > 
> > Which file names are / were in use by the upstream kernel? I tried hard,
> > but I couldn't find any mention of venus_s2.mbn in any of the patches
> > on the linux-arm-msm mailing list.
> 
> venus_s2.mbn is not used anywhere. It was earlier planned to be used on

Ack, please split into two commits, each having a proper explanation.
Please make sure that in future we don't add completely unused files.

> qcs615 while venus.mbn would continue on sc7280, but then we wanted to use
> same bins for sc7180 and qcs615.

What is the status of the current venus-5.4/venus.mbn file? Does it work
AS IS on Talos EVK that is being in process of upstreaming and on QCS615
ADP AIR aka RIDE boards?

> S2 variant can be produced now by re-signing this venus.mbn itself. To
> achieve this part, there were some elf alignment fixes, which is done with
> this bin to make it re-signable with any vendor specific #.

I thought that this already happened for VIDEO.VE.5.4-00060-PROD-1. What
is the difference between it and the new one?

-- 
With best wishes
Dmitry
