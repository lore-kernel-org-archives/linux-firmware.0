Return-Path: <SRS0=N8LK=7R=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93201D25030
	for <linux-firmware@archiver.kernel.org>; Mon, 12 Jan 2026 06:05:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6C54CC19422; Mon, 12 Jan 2026 06:05:45 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A2C68C116D0
	for <linux-firmware@kernel.org>; Mon, 12 Jan 2026 06:05:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A2C68C116D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BMb1QS1235114
	for <linux-firmware@kernel.org>; Mon, 12 Jan 2026 06:05:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VHe32LZjTWW/f2Nqz7C+8o8t
	3DyExqrvmAxoKCXCvHU=; b=UQYJf4Hovbpqnu2fYvqsebH/RUiIPNSRiJRrjZL2
	8huxsYM/1+sKINo7EoDcPFK4JvBNlsNTK6KJpyNvLnE/tcQ+7+Wakm8Y312nHIEo
	aE2PRDQaolDtRqijVNh/tuZA8xXfcUfaqLhw5hANfQHdHBCKnFc40J9d5TbXy5+m
	Io9VwMnQlMFXhK6L/vJq5ogC2Hg2PJuWgPwGIDyGOeOZSA7QRYzELHoFq70LN7cE
	06IuBdo585laPO7etLdAIZ50SKsqge3O4QOobIzJDjZZqz3cnoZa6AeuarOk1kra
	lf1+GA2GNWAHQ/CyTDXIK8F3pvDqYGePSIs4VlK2KRoNmg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkfxfunjh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 12 Jan 2026 06:05:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8ba026720eeso181713785a.1
        for <linux-firmware@kernel.org>; Sun, 11 Jan 2026 22:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768197942; x=1768802742; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VHe32LZjTWW/f2Nqz7C+8o8t3DyExqrvmAxoKCXCvHU=;
        b=PRoUha+dMxduGcTBABuXvrSmpcvQZnlbrtuVg6vuPKhMO9RUAeIW/PA+Fx3a9IzOCg
         iROrYjPbAQGn35wecg/6vkMUNlC4v+GSqE5riU7y58ymsC5MntdSKWJpqPMhJhyTBG6t
         4ikgjE+H2jIvrvS+mSPIBGWqzYM5JMNRBBZ8oDMaA8cwDEUhDvuUyoZxG25BiplUiJ2e
         jGP/0rFtsV1O3icRtFA3i7k0pRcr97+5lGdKLbcsLg/SIIkE2UloWeodY2gfUMU+ALQ4
         ETmKbvk9l5zyKZYKhudW933uCVxM7XUnJPv8RdIGvK3qSytYZ0cepwVtCnkGiEGQHMoD
         5TWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768197942; x=1768802742;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VHe32LZjTWW/f2Nqz7C+8o8t3DyExqrvmAxoKCXCvHU=;
        b=pcYL87UOFH5WRx3BfplO8mQHMNME8ZhP/J7FUAwxihNrKbH/Z2mUuqy/MPlDyeVbV+
         KmB736bB7cN84kDHwZzonGInur/HIiYXJuSHew4AV5wI1DOrlipltylNuD68ZuHSxqTx
         D7PvqBEFxARtEV459nNEALsnV++I0xhowZxsvECK3u/52VjghuGuRJMZVbJzwc1AEHbK
         C4ji2fCI+ErjGl8XbPemzAaJ0C/Nyc69ZkEBJZPe3KyE4X3tPQO53vkq5cOov4gIrnzU
         Jc0bvPDxtesJfwNzQ3fROZpbk9fna91c4ybLwegBWFzSLcC9muUE9DNox39NbVmnMqiY
         IR4g==
X-Gm-Message-State: AOJu0YwFTLqgxS+IyH9SU0szX41MR+7JoT6wOcFYfUhD0Qi+5pUw123z
	vbabWjEMJ7u3vOFnFyUPvai4LPmdkHdXCbG7sKUNOJVFqt64FTxZS1BuxYpocVqu+VwJbGpajPG
	cf5F41MUgP1PM4BKHJRiaBhvKJUMKJt4A2qPh0mGsKdDeRIcf4RjKZp06cJXvcqUGKQl2+dU=
X-Gm-Gg: AY/fxX5Ng54xxEAMPUczMz4hyLVhgI1iVUlxrg8HzI0NavdZ7y5iyTi6h/EiXfJcyz7
	oZliIyRMTDlGS5tFnowOpjpXeouO8nRK7suR43dPPW6rQk3ZTFJNJBX+fI/yQISfCqsbH2s8CEi
	4cbnjGXDehXBXbT6Gh8AzH/TWu0EkN6SF0KF4HYcPMzY7QdU02p7D9Tm2JVifurFVhWQs6b8cRW
	F2eug0sNAEZQjmQCRTod2JGVgLyFhbDt6oA6kOr/woqOVx5qVE9ouzcGX/k6qjjETzWVp5VYBza
	Uogm9u/uC2LYUyhVEAng2NsuZmUlm++PtRGtPfs3mVl3TNFEkTiJGf1iKIAIzscB4XVy668jvEO
	SnUeE6fkM4ZTmYAd087TNS9nnnAhqUbsGLNIdAsLWx+daRCsNCgfuzALMKXIZKmpP+6pWxp8VOd
	qaratWQX5WkWq1LS/dnb3haqg=
X-Received: by 2002:a05:620a:45a6:b0:8b2:dd02:c088 with SMTP id af79cd13be357-8c389384d30mr2142646185a.24.1768197942134;
        Sun, 11 Jan 2026 22:05:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFeLGN5SlCDlAZwYCS78CNjZBqDMrTKXaFuvLuTOlioIuqAqjKHDutKCY85TYkoODmYB9bsfQ==
X-Received: by 2002:a05:620a:45a6:b0:8b2:dd02:c088 with SMTP id af79cd13be357-8c389384d30mr2142644585a.24.1768197941659;
        Sun, 11 Jan 2026 22:05:41 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65cea814sm4589441e87.12.2026.01.11.22.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 22:05:39 -0800 (PST)
Date: Mon, 12 Jan 2026 08:05:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Subject: Re: qcom: Update ADSP firmware for qcm6490 platform
Message-ID: <jkfd6edfz6lfvhz7ilma3ece2np4p6ybijgystonmoau2zrzdz@rm2odyjbopr6>
References: <89b5d0b8-9928-40ca-b8eb-f40080b6f3be@oss.qualcomm.com>
 <CAO9ioeUTNWu7YirxV-qnU3q9ot=Z1UYZug2Q4ArQBd+smQ+0mw@mail.gmail.com>
 <162744c4-4624-4371-84d7-3db767b40989@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <162744c4-4624-4371-84d7-3db767b40989@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: mShh-ssz3iqr-Jiqvvld85lWgmEyyCd0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA0NiBTYWx0ZWRfX7BhcJkFAAgEh
 spuznM7/CoFqjhiQoXK0CgT/7R3TT79b0aX1g0YJ9ffGJvNLdy59QZZXRHDG/vN2tngGZlxC9Hd
 EMpjxEWeuEhjvtXXrpZcjulVKT7uaoq42O03sw+sUugqoemJ1Z+NsrrnEFs3Z5oWkBqkhzKbBua
 DgS78yns8E0i51OYOV+qtjixe/93U+nk+Mhhtf+lJnvd28NmTy2ilLZR8nXdZG19AuUY8Bk1BZZ
 D01VAGCjKRb+R2pkuHYTnLt5aLXhoz0Sj4q1xJC2D/CKqG1sshTxp29WHnZs72MAhuA4kN/Psiq
 8dHw2KA0B2mTks/r0Gxjyb8CjwTZjnF4Qq8+2asw2qmeOVrGFMBud4zpgrX6dZoro1+wcgefVCe
 vevDfauRJJshwu81i81TkoI6ORLTkY0VN0PhJr3dMGhTS7aWdwyldE2/HwBPPt+g2DiMAxPMD3C
 UgOT/D1QwKlOiTOJcAw==
X-Authority-Analysis: v=2.4 cv=c7WmgB9l c=1 sm=1 tr=0 ts=69648f37 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8 a=UXm1Wg-_B6JEaqjCGrgA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: mShh-ssz3iqr-Jiqvvld85lWgmEyyCd0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120046

On Mon, Jan 12, 2026 at 11:18:29AM +0530, Venkata Kota wrote:
> 
> 
> On 1/12/2026 11:14 AM, Dmitry Baryshkov wrote:
> > On Mon, 12 Jan 2026 at 07:42, Venkata Kota
> > <venkata.kota@oss.qualcomm.com> wrote:
> > > 
> > > The following changes since commit fd6473795fc677b981a076e12ff10044d3e5dfa3:
> > > 
> > >     Merge branch 'main' into 'main' (2026-01-10 20:55:47 +0000)
> > > 
> > > are available in the Git repository at:
> > > 
> > >     https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> > > dspfw-kodiak
> > > 
> > > for you to fetch changes up to 1ddcf07a2c4859c6914660a077c5649dc4dab281:
> > > 
> > >     qcom: Update DSP firmware for QCM6490 platform (2026-01-12 10:42:59
> > > +0530)
> > > 
> > > ----------------------------------------------------------------
> > > Venkata Kota (1):
> > >         qcom: Update DSP firmware for QCM6490 platform
> > > 
> > >    WHENCE                |   2 +-
> > >    qcom/qcm6490/adsp.mbn | Bin 12693084 -> 12095036 bytes
> > >    2 files changed, 1 insertion(+), 1 deletion(-)
> > 
> > "Update adsp, cdsp firmware for Qualcomm QCM6490 platform."
> > 
> > Where is the CDSP firmware?
> There is only ADSP update. Corrected the message to reflect the same.>

Please send new pull request so that it can be picked up by the robot.

BTW: is there any changelog associated with those DSP files?

-- 
With best wishes
Dmitry
