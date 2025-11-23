Return-Path: <SRS0=tsBH=57=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ACEBCFC518
	for <linux-firmware@archiver.kernel.org>; Sun, 23 Nov 2025 14:04:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 01F59C113D0; Sun, 23 Nov 2025 14:04:21 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D0216C116D0
	for <linux-firmware@kernel.org>; Sun, 23 Nov 2025 14:04:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D0216C116D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ANCoGfh1167304
	for <linux-firmware@kernel.org>; Sun, 23 Nov 2025 14:04:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kIQXksD1+6SDUmTMSnfV9teK
	jLLZHPsYxRRVvLas3lE=; b=SksbuSa5wLyIO56XEp4lfEGOpLldn30VHHchYbC5
	58smXuRaAYxfu8AoZTnUkA5eXne1iPrdvQYk1QBU8SKQv/a8LY3ug1Fe2gu/kjpS
	6PXq/2zfyT/odEBu+shVol/Gv3q8AJg+lrevWsYz4n68gbP14Le7c7uK3Ni0Nzb0
	vIfAO5MSlIU+udhOYTrXK7QQ+dYajuUXAqkVt/5EWzswdx26ZAYg48jQCHO//PAl
	UCO0TQGEi0UFMyfysqOHkbQo8xCHJI8UQr//ayNTt7MeW3vG54V7RcsC0q8ZnxxV
	TYf+U1i4jF/I6uIxm0XKP116JMHCwze7sy8TDwehDquDGw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak68dtecq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Sun, 23 Nov 2025 14:04:11 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88041f9e686so108861676d6.1
        for <linux-firmware@kernel.org>; Sun, 23 Nov 2025 06:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763906651; x=1764511451; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kIQXksD1+6SDUmTMSnfV9teKjLLZHPsYxRRVvLas3lE=;
        b=Yz4JYmVi77fBjoPOT0vnI3HBjubX5Jsqwwhy8dszkqdWUzUy/q3yZKOzHIQxTeSC6q
         x4pfHhr4lXSdxbK6cTmWsSP8UdMpKnJ7WTJSB00/7z17fMFkM5LbNTwHtxOeTTZ/KCwL
         4xFf6b3n7f2DTZjP12N3R5OlS3OZIBzDZDS0H0ulqG4doH67T0HE2woeXLyRu5tAaryD
         mntQE3Wxv6eSvkwfkUMu6XV6ujnhJol43YWoYYUcMmgfzWDDmgyJ2dmDoaWB3LSOK8ac
         BvsLOvdDHpe2qTxrEQlyTs9DIBQW4FrQpuGDgVX68JDXh5vuPJGKAdGpyHrinB3T+OSg
         TtZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763906651; x=1764511451;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kIQXksD1+6SDUmTMSnfV9teKjLLZHPsYxRRVvLas3lE=;
        b=UFE8mtAiQMbFh6iFJE4b/q+yu917C/wK/JWjBBAYAbNIaFHXeSrdixWBzWAPkrWBXs
         NI9qJ+yHg1zbYmb6PnAUMyYX83emkk/RTlg8hxoc2LYJhErrKw6l/wxO7CiTNfsvr37q
         dE1c7ftmIfRHtgbh2Tl8XF5D7dYDMNlSEhSIUljxKSXQJtbUCoqMD/uQP7GMNEysqeND
         TJdzsyqNZ1GjzkHzLc7iegb2mthtzHKN4C+jPcawOqU+EK+2BW7r86LZGuLDdpl0vUG1
         cP8OtUb1L219RZ4o0PSoiORjABUz0NRuKM+dzkCDityHULgtca0MnN+ElqEud4r74zoB
         5LVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUo8kLTA46BLordr/U5LzEJmQVSDSpyTOFEW9gLYc/VWyfTVQ70dgOgaBlF/AEftMZLOQr0Dj3OYUOPMh/9sw==@kernel.org
X-Gm-Message-State: AOJu0YxkbHQMqn7qMcz9UfSBBKNoH5OVMw9+J2/ADpzfhd6Ny0HTTspe
	RfOBGJNTqHN0glhHXhNVRPdYsfxSP/bzmbKpOSb43pv9MfZt+kKq6BKv3pk9LyrntAoqcppXrBp
	ZnWw3ECf6MEhfCLmL6rgo7MwgcrdrBS7lQk3zeCGVcbPmRn23WIT3rGiMq28eb8M=
X-Gm-Gg: ASbGncvr7mi+XEM3DrswxR4Ttw6MH301dhinPn33Oy4AS9i3KC4lFdTHeMcI5Awluyt
	RIObUHXBMymuZJ1LSG3MZ+IP2IRzHFGzN2L6ww0WKiq9lHj6SRgA9pCrRkn0J/izr/Clp2XNZlK
	sqrtQfpPPB8rldBFOlkmhlNpQgYZ0fgyYnYANmnNsCF6IfVguFaOX1413I5uR1RO48NO0WwcnnF
	4UYIUcsvWctS/jbGJfAb4Ul7JqQmhEgoUiFDWHd/1/JUD899SXezIArD3P+g/7cwi5WI1kXq43Y
	P3Rb7P2n0XhYRzk81McgApjRUKXQ0g7FkW47TaBLbbEp7I0YX1NAqi+kZQV8pM4xw3uJz53JC5x
	osC2qupoeyyAKLJJltcWC5Wsm2El+Lyye46rKMsy0wksfR5ceDjaK7fX/oDPBxZRIoHswWiABiZ
	7LMIdWO31CZlH4j+UR6yZ+fvs=
X-Received: by 2002:a05:6214:d8d:b0:880:57dd:5f15 with SMTP id 6a1803df08f44-8847c534517mr124669926d6.54.1763906650670;
        Sun, 23 Nov 2025 06:04:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFfjoGcV45DPhPepM3F6l0GjH9qQDHmDe7xVerH+yz6+TmBWarn8+u8xAR0g6pKONEzmVRL5w==
X-Received: by 2002:a05:6214:d8d:b0:880:57dd:5f15 with SMTP id 6a1803df08f44-8847c534517mr124669086d6.54.1763906650199;
        Sun, 23 Nov 2025 06:04:10 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969db75699sm3324296e87.18.2025.11.23.06.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 06:04:09 -0800 (PST)
Date: Sun, 23 Nov 2025 16:04:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Korenblit, Miriam Rachel" <miriam.rachel.korenblit@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Josh Boyer <jwboyer@kernel.org>,
        "linux-firmware@kernel.org" <linux-firmware@kernel.org>,
        Linux Wireless <linux-wireless@vger.kernel.org>,
        "Yang, You-Sheng" <vicamo.yang@canonical.com>,
        "Hutchings, Ben" <ben@decadent.org.uk>,
        "kyle@infradead.org" <kyle@infradead.org>,
        "Dreyfuss, Haim" <haim.dreyfuss@intel.com>,
        "Damary, Guy" <guy.damary@intel.com>
Subject: Re: pull request: iwlwifi firmware updates 2025-11-23
Message-ID: <mmrknanooabtlsdkkhl7gcwyoby47of35y3hij6lvl4hhq67ff@nlyx5skcmskj>
References: <DM3PPF63A6024A9CC529E3991D0F473DA69A3D3A@DM3PPF63A6024A9.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM3PPF63A6024A9CC529E3991D0F473DA69A3D3A@DM3PPF63A6024A9.namprd11.prod.outlook.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIzMDEyNyBTYWx0ZWRfX16qigvPQvTOQ
 UnXNGiSrK1fpKvbaidKAA6q5RHyZTJ42NUkPVIdHBCB3iLbc9gbxArpzrmqqbchkXWFXd8/Zwn+
 i0yHq4Jbv7p2gxaCFps9APCN/0/lykeRKmhOdJ3p8kcLcmne0bjs0Ji74Oapht9F10TgO1zkHuM
 bXRF7EEJoSxIIc/oqnBr3jEZ7G4/ky7HyBLqzMgcFDwWApimvMT10PXsGauU2o5ps60pMvpoTkc
 RxXcrSFjkBQP5glxPU+Q0U2vNM61157aSnGRbrxRWY8I/S1XsmRyxI0ivrd3ttmMW1Px5+W9IGJ
 FtFKhN3qLfL7A5BGF2JPZbsdt1J+dJEzQ7dMaW/kmla36w4jbdMa4geeSYuEoRCUz/a8RW3pU1x
 tJV7AO/p1tLYLOOFGfiQ8HHn0UfjTA==
X-Proofpoint-GUID: _BLamrOohTqmIXIsJLBi71E2_xgLDXnj
X-Proofpoint-ORIG-GUID: _BLamrOohTqmIXIsJLBi71E2_xgLDXnj
X-Authority-Analysis: v=2.4 cv=UsBu9uwB c=1 sm=1 tr=0 ts=6923145b cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=p0WdMEafAAAA:8 a=bxv7W_3ZIfJsmQTpWdQA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-23_05,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511230127

On Sun, Nov 23, 2025 at 01:11:46PM +0000, Korenblit, Miriam Rachel wrote:
> Hi,
> 
> This contains a firmware of core98 for SC-WH.
> 
> Please pull or let me know if there are any issues.
> 
> Thanks,
> Miri
> ---
> 
> The following changes since commit ff6418d185528bb9b040de1066c34fa405ecd4bd:
> 
>   Merge branch 'amd-staging' into 'main' (2025-11-21 20:17:56 +0000)
> 
> are available in the Git repository at:
> 
>   http://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.git tags/iwlwifi-fw-2025-11-23

Merged and pushed out, thank you!

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/796

> 
> for you to fetch changes up to 4b245479aacaba0e3b073c31151b711e7aae1268:
> 
>   iwlwifi: add Sc/Wh FW for core98-181 release (2025-11-23 15:03:47 +0200)
> 
> ----------------------------------------------------------------
> iwlwifi FW for Sc/Wh. Core98, build 181
> 
> ----------------------------------------------------------------
> Miri Korenblit (1):
>       iwlwifi: add Sc/Wh FW for core98-181 release
> 
>  WHENCE                                      |   4 ++++
>  intel/iwlwifi/iwlwifi-sc-a0-wh-b0-101.ucode | Bin 0 -> 2096172 bytes
>  2 files changed, 4 insertions(+)
>  create mode 100644 intel/iwlwifi/iwlwifi-sc-a0-wh-b0-101.ucode

-- 
With best wishes
Dmitry
