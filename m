Return-Path: <SRS0=3+pS=4Q=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B0FCCA470
	for <linux-firmware@archiver.kernel.org>; Tue,  7 Oct 2025 14:07:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8E368C4CEF9; Tue,  7 Oct 2025 14:07:36 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8119FC4CEF1
	for <linux-firmware@kernel.org>; Tue,  7 Oct 2025 14:07:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8119FC4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597DL4Um026712
	for <linux-firmware@kernel.org>; Tue, 7 Oct 2025 14:07:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gb3yFTFCZx66/O3gQPgiI+9CXDDFoJ+gDxma89VG2RY=; b=YvPUCCigCVP76AXD
	rdS0iGu1PjKlCHpYuLLBikd4eXr3f9/SyTyU1jmE37bcMlECMDJ0Kh/qH+P8H5eo
	5OxUpbTnIfSoz6PY5bfgqLDbu2GG/X6eSQh8AtTpB2ubt+6mpcC5g3c62rILWpMt
	lqXPgANDcXO/D1845zOXuFpQiQhcW5pKbUR8gVfoT40/qgrFqQuaXJBCPF5j0r3l
	OgYskzkXepJIJ3MdRy9kOIQxLgIG5/OL7wSTk7ztRi50l5M87HetPKGxPWCsBPu2
	EM4jydRMIuDOTQZXzzFYGyYhs/JeWTXgBUNha9jidYG8UQTlp+stjv9Rq37zZEz9
	aGKxhQ==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mgd0k5k9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 07 Oct 2025 14:07:34 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-435de8296d5so8406858b6e.3
        for <linux-firmware@kernel.org>; Tue, 07 Oct 2025 07:07:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759846053; x=1760450853;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gb3yFTFCZx66/O3gQPgiI+9CXDDFoJ+gDxma89VG2RY=;
        b=UEPfD8ZmQY/hjojEE8BMIws2CyrKXUflTo2Oh2K0aiGBQ1IUIqVKtBOoVnBRJUrfoG
         4dVm1+NPvLr7m4zeSN3xE+ZH0UYkLLQiCEC2+HcIxWVwppLVOVkahmU+ePIDo1M4tQZb
         65cP0FyNK8ITzv744efGNrnIpqoSrCCDhPCyDqpu+w40JbgStIH37F4324ptLap7l5Mf
         98+da34tNRxd287S/nb3VqXjX7In0McBZMnrYg6l5kVKVIhTRtVddmQOOJwB1sSlegrZ
         n/8NNS5OOubavfV2VsbJ2s/01jYGOSf7rUWV/4IT+Deb0jsTA7+rx3DFaGcHKwPfkz7E
         BTCg==
X-Gm-Message-State: AOJu0Yws8TnuRCS+cRTYBhMGiXz5frA73tve1Jva7oUYKpeTyaiDCKff
	ucpP/cxLuPQdIsbIopFHpXMT9MKbGjjlg+O/rFu4P6yqdNu5139omZ0ndkQWiAojzsY2blMj7Yf
	9iUQWKWiIknzIx02QuWZJbKXWZJIC7qG4WaqVxiLG7yBFVRRd3YWKGDklhHWTD3U=
X-Gm-Gg: ASbGncuClONGcwqc/plGxpJVRx6cG8Rz+nSE9nB09aOV5ERQWxgqS19qY309fxRmTN/
	T5DJGsQZalT0X6G+ELvlLGuBZNmhsSPXswRA/q505HV5njtZNOpIzTt0lnPVnj+DLuLRbdOFE85
	hda4YO3eF0jpG70wzcS6EJ5tEupNzr6bfXsukYi28AsQGbBgxQ2fRMvIULp10Gx+3tOfQ+zeKdX
	g3hrdMnf3LC+IziIt6Fm39DSeYRPn+Qf9MUKgt1iQaucG2ow+KVhvBHvXny0uBwB+Pl1h5oalIL
	UVLHe9gsghlqREjH5pSgjNmE0nOph2KlYa7t14Cl/6H37Jk3GCRthBWj9zbGtcoIqka7QxTp1e4
	AkN87cvvd6dRU4g+JWiCoqA+l9mQYA90A8mOvXUQKGyepi3NMzDkbkP+JTQ==
X-Received: by 2002:a05:6808:191f:b0:437:ae9d:114d with SMTP id 5614622812f47-43fc17920d4mr9664760b6e.13.1759846053167;
        Tue, 07 Oct 2025 07:07:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPN0XOFlA4ADO6CrjZjM8si3Gwr1SaKjAoRhmGy2SaOG6pMff7NmBC7kzkob22etSwt72Izg==
X-Received: by 2002:a05:6808:191f:b0:437:ae9d:114d with SMTP id 5614622812f47-43fc17920d4mr9664696b6e.13.1759846052488;
        Tue, 07 Oct 2025 07:07:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-375f39fc905sm10167531fa.20.2025.10.07.07.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 07:07:30 -0700 (PDT)
Date: Tue, 7 Oct 2025 17:07:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Janaki Ramaiah Thota <janaki.thota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, hbandi@qti.qualcomm.com,
        mohamull@qti.qualcomm.com
Subject: Re: [GIT PULL] qca: Update Bluetooth WCN6750 1.1.3-00091 firmware to
 1.1.3-00100
Message-ID: <zsddtjaefzbj3flnddfiac63hdhrid6vadziguyufd3nvxbczs@56ewmb74font>
References: <CAPiVHHi2dk5eX2vRqzX014q__WH=-YNghqv-kZgSfbzGvUgJHA@mail.gmail.com>
 <CAO9ioeWCfAFMZEwpC5U=Jh006TR38qhE9uzgTpWnq7YDfSOvHw@mail.gmail.com>
 <CAPiVHHiTQpEgC7Fs4qYQJ_N3a+nT2LGKD3xkwjBfmfyD08SZgQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPiVHHiTQpEgC7Fs4qYQJ_N3a+nT2LGKD3xkwjBfmfyD08SZgQ@mail.gmail.com>
X-Proofpoint-GUID: TzS9sLNH1J_f5susuP4jT0ME4RO33etW
X-Authority-Analysis: v=2.4 cv=T8aBjvKQ c=1 sm=1 tr=0 ts=68e51ea6 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=B4fetI1LyeD2TB1mjEcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-ORIG-GUID: TzS9sLNH1J_f5susuP4jT0ME4RO33etW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDEyMyBTYWx0ZWRfXyA0QbK7Ya49c
 zaG+06ilXsp4ZzC7wTekCIf6GOcV+Z51eZw6qmvJA9l3U8I2g4aljuEPtCEyH9kjzTcr6N4agNL
 S+I4moDx2cilQh41SVHmKwfvR5WpH5R5TFGPg4lqb4MPXoDd+EG6t3RSJKsIq/Fu1e2onlY9zIL
 33tvxR+UYP+jnP5ICCO0lR5tKDNtsq0zAvDMUHDs0hi3zUpgk1TZWceDqbRG0+662ZbkgHD6QN1
 WSFs12xUXN6TLxsbNUnnhpSwDt9wVjLP4DKaMugGJG16T1Oe1XC/mqCTtkQ+bGNTzXws2XiTHIK
 Et4Kyv/YHKcEtXXA8zXUS+HdqY/i6J8FsG+HBMIQSD2HAt39WNg2EGW92x5UaSb2PYhY46fv2Zn
 LFV+tZPzbs15Jsl6iu6yHi0xlADGdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060123

On Tue, Oct 07, 2025 at 12:22:46PM +0530, Janaki Ramaiah Thota wrote:
> On Mon, Oct 6, 2025 at 5:21 PM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Mon, 6 Oct 2025 at 14:18, Janaki Ramaiah Thota
> > <janaki.thota@oss.qualcomm.com> wrote:
> > >
> > > Hi linux-firmware maintainers,
> > >
> > >  Here's a pull request for bluetooth firmware. Please let me know if
> > >  you have any problems.
> > >
> > > The following changes since commit 46a6999a2d14a5f2239e7e712e5bbcf543f59034:
> > >
> > >   Merge branch 'robot/pr-0-1759560666' into 'main' (2025-10-04 21:36:21 +0000)
> > >
> > > are available in the Git repository at:
> > >
> > >   https://github.com/quicjathot/bt_msl_fw_1.1.3_00100.git HEAD
> >
> > This commit changes the default NV dump, but leaves two board-specific
> > files untouched. Are they still compatible with the new firmware?
> >
> 
> Hi Dmitry, Thanks for the quick review!!
> Updated the below pull request with updated remaining two files

Thanks!


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> 
> The following changes since commit 46a6999a2d14a5f2239e7e712e5bbcf543f59034:
> 
>   Merge branch 'robot/pr-0-1759560666' into 'main' (2025-10-04 21:36:21 +0000)
> 
> are available in the Git repository at:
> 
>   https://github.com/quicjathot/bt_msl_fw_1.1.3_00100.git HEAD
> 
> for you to fetch changes up to e06a43b9eee777b8fd9197c09b50c8744118e8d7:
> 
>   qca: Update Bluetooth WCN6750 1.1.3-00091 firmware to 1.1.3-00100
> (2025-10-07 12:14:26 +0530)
> 
> ----------------------------------------------------------------
> Janaki Ramaiah Thota (1):
>       qca: Update Bluetooth WCN6750 1.1.3-00091 firmware to 1.1.3-00100
> 
>  WHENCE           |   8 +++++---
>  qca/msbtfw11.mbn | Bin 202276 -> 202464 bytes
>  qca/msbtfw11.tlv | Bin 190064 -> 190252 bytes
>  qca/msnv11.b09   | Bin 5847 -> 5885 bytes
>  qca/msnv11.b0a   | Bin 5847 -> 5885 bytes
>  qca/msnv11.bin   | Bin 5905 -> 5885 bytes
>  6 files changed, 5 insertions(+), 3 deletions(-)
> 
> > >
> > > for you to fetch changes up to 64b8572f8542709bb9331fd30da0165c4ecfdc24:
> > >
> > >   qca: Update Bluetooth WCN6750 1.1.3-00091 firmware to 1.1.3-00100
> > > (2025-10-06 16:18:31 +0530)
> > >
> > > ----------------------------------------------------------------
> > > Janaki Ramaiah Thota (1):
> > >       qca: Update Bluetooth WCN6750 1.1.3-00091 firmware to 1.1.3-00100
> > >
> > > Thanks,
> > > Janakiramaiah Thota
> >
> >
> >
> > --
> > With best wishes
> > Dmitry
> 
> Thanks,
> Janaki Ramaiah Thota

-- 
With best wishes
Dmitry
