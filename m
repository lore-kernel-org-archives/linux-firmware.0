Return-Path: <SRS0=WOkb=36=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A4E4CAC592
	for <linux-firmware@archiver.kernel.org>; Fri, 19 Sep 2025 18:24:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 33ACCC4CEFC; Fri, 19 Sep 2025 18:24:53 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 58AEFC4CEF0
	for <linux-firmware@kernel.org>; Fri, 19 Sep 2025 18:24:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 58AEFC4CEF0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JHVIV1013545
	for <linux-firmware@kernel.org>; Fri, 19 Sep 2025 18:24:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qsCHK63YuQHz35rx0uSAK/z0
	wfVCJ5WFywoDVhDMxUA=; b=M5Bvmy+ZNsa9o7kj4qMxCsLixX2gPML3AfpzhSae
	Z9s8wM3zAykcpMHVVQURQ7NJqBZ5pha6f/618NlXKUHqdUXK3PE1eM6+IftnL2UK
	W2VRfJ0P/u5d8KKP1L76diUiO9asnBo76c8myrbjcW9DGWpMZCpNvm9S2N3ebDTX
	m+oNQBDqYG9kzmZxb/Do7xtzT5xcjnrfO5jic+ZpokWU1CdnZWSKSHRKaMqL+twR
	3QiowK7GerQHjtqQAPqxH718xzP8Slcq1fXpgaSgVPRyLFfocSU/kMt3rGCJod+m
	QW6++SO5uJzNGdJAVDPi9tnSufkVUVCWM4ecMp+SipPRwA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499bmy05bx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 19 Sep 2025 18:24:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-82ea379874cso637465185a.2
        for <linux-firmware@kernel.org>; Fri, 19 Sep 2025 11:24:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758306290; x=1758911090;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qsCHK63YuQHz35rx0uSAK/z0wfVCJ5WFywoDVhDMxUA=;
        b=I023FjxkeyhtAwioBTFj0TkfwyAURSUrXddli3vtLff/eKqszDseWR1COqmY0nM0n1
         4k/9rj/Lf3TmFzN5CV3a2kqM5/qA1C3GG8yMxioY+oi77cRnVjrxKyESzbKFplQnvHuI
         JgwyT7GVy+mb4367zBJ8Py//NXnV2Fm/GEsn8tJbBMKxbHCHcprddbA2/wUpgFKKko3a
         er8ojBCazENbQRUDrcB9xRCoZFHfkhw/KKt8MEiP5QQ7UvrTpUomYWyjpr0q8XKo1JId
         nLvAfenlmONR/bBdEXemJxDh3BSOaIK/KGoxR/7Hq/yI6QMY10n8gfEZaXfZ5hc+zjf7
         ofWA==
X-Gm-Message-State: AOJu0YzATjyQuResqcUdzqnF/wUHfXD7TjxUEQYNQrpUSR0pcDOpQ6iF
	Xp/x7FXvQBBeQPAm5QUuYGoXDdr0c4/ZdMN5AIdDJbd5ivCUPZUHNQPekM2bflp88MJllnO4EW5
	U2WNQ7sFpdnSlIL7a2Zqp46E/c0xOBU4dxqp5zCrEU94ImUahOW7M8ZKqfE49Zb8=
X-Gm-Gg: ASbGncvpEZFvg+adjwh+OEcFO+/mpqDohIobIukzQwAn+f9uLQWm9iq6w3W8zrJKl54
	4EVqmx9zfoHx0GHr/r0VHb7ntfKn0IIhro5zedFTQPBtfIPMP2tUxdI1wpb/XJu/MrRGQZMs4F8
	/F8W/ISXT80Ha7VC0+A8MAZq6hP0WNoB2nrPIV0BzqF+aDsofqOJ3gVUAkCLSsUgvAlyj+Z5Rcs
	b4t3u2EgNVasXjeZAL+3kKBnfLTKCHZWQ1kGoYYpT8FUraVFMKs905v3JmR1KaZrApE/XFe/cWB
	N32okzSi4q5sjtGZ4P8jjtahxgmf+Ve8pFxP1o1vb3aM6ME879nxyqf7+SKugJ8ig3PGZvnf9LI
	j5I+jcsle7YW5bh7hLTUdQ5bvVrjs+HLN86YK0LZHBfsL7O0Lrdjy
X-Received: by 2002:ad4:5962:0:b0:78d:8207:a2ec with SMTP id 6a1803df08f44-7991a92cb5amr45931306d6.43.1758306290116;
        Fri, 19 Sep 2025 11:24:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHx1ytfD71xhm0IQvtubcUKSDvoBcGUyWIBf+MLdcN/hxbQd1a9JwaeXyD5l+yAW9NWmWBHRg==
X-Received: by 2002:ad4:5962:0:b0:78d:8207:a2ec with SMTP id 6a1803df08f44-7991a92cb5amr45931046d6.43.1758306289613;
        Fri, 19 Sep 2025 11:24:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-579d7104ba7sm831275e87.130.2025.09.19.11.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 11:24:48 -0700 (PDT)
Date: Fri, 19 Sep 2025 21:24:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, ekansh.gupta@oss.qualcomm.com
Subject: Re: qcom: Update DSP firmware for sa8775p platform
Message-ID: <gngd36jovqcg4ipyfl72vuif7wlcw62q2eaagw75vu5iy4z4ns@vbiqidgb7v64>
References: <1fb5db0f-161c-49a4-a09e-d6b58427b0ea@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1fb5db0f-161c-49a4-a09e-d6b58427b0ea@oss.qualcomm.com>
X-Proofpoint-GUID: DK4kviagr5tI4NXCAKPEbtU6Bjm0HN4V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE5MDE2NCBTYWx0ZWRfX8cSyJ0CfmAVF
 2fdG4AiSKmWBYapvOX5GPLSD2CuT81bk2av075e6+bsQ45k3atdTmGOnjfT6zySsaCvY9gP2zn7
 C1drxdpRjPVUefefvh54enfyzrcT6Z9jtEfH1cxjB+8Wayl2mDilH2sA/7L3pS/vTgFtuA8NNxR
 KEWWzbpxVB6B11d0rENf7nBA0bAWhOsBnQgRmOZQ1+XLl3jnYhrc+yJuTznlvQ8mQEjs+42clHe
 20eoVStttb1mFy037zZyo1zuTkSgP8PzV9eKhqry5nvfDEibl9PNIGTaSGYSeBdZKno0PN1RG5R
 Suzx482OvNJa9kkZmBvE564eXkYkR5RNyJBI/X5axjmgz3QWBQJLEfD2rxjWV5zl4JfaxiGiCxg
 QSPiRW8J
X-Proofpoint-ORIG-GUID: DK4kviagr5tI4NXCAKPEbtU6Bjm0HN4V
X-Authority-Analysis: v=2.4 cv=ftncZE4f c=1 sm=1 tr=0 ts=68cd9ff3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8 a=u_cciQCpF9CQ3pfIqNQA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_02,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509190164

On Fri, Sep 19, 2025 at 11:10:12PM +0530, Venkata Kota wrote:
> The following changes since commit 3124a51452eb5ba129815583f5b3af5ec0ef5b26:
> 
>   Merge branch 'robot/pr-0-1758219630' into 'main' (2025-09-19 14:31:28
> +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dsp-fw-sa8775p-dsp125
> 
> for you to fetch changes up to 69c2e06617b78403fc06eb021fa9c0a33ab330d4:
> 
>   qcom: Update DSP firmware for sa8775p platform. (2025-09-19 22:20:24
> +0530)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Nit: usually there is a space after the comma.

-- 
With best wishes
Dmitry
