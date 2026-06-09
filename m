Return-Path: <SRS0=kxTT=EF=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F78CCD8CA8
	for <linux-firmware@archiver.kernel.org>; Tue,  9 Jun 2026 21:46:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3D9261F00898; Tue,  9 Jun 2026 21:46:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1781041568;
	b=CX4ppLH7GE2+sh6aZ8qCVapgx4XjVkbn0i/YMmZ6KwEmIVC0rJtC0gCAl1j5xBCkEvGR
	 ARrI7RCnjSQ3Gimaj6gUAydxEElSEVdTMAzFZkrP3gP4LM/D+at93unmZirg77w5g87uy
	 9ITmRqaNGET78qdAb3Bdf3ZoNHVbzesADHFZKZKJ/V1vI5rR/edpRixxtrxXsrXsX13Ys
	 dhmKdSrgkRgLoRQDjP730nR1sKKQQuOdF+71TQhPmW/U3lPxgSSew3aCOD5m7ZbKdt73c
	 F1k8jsa/awyxV43owu05a3NyErNFG5xLTQDbrHxI0pQte0w7GP71gQnvUcioVy1LdAQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1781041568;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qFIX2VVTFi4DVnoyQLS84Jpsc7A44QKkcFUVZv0stPs=;
	b=MymxYxgXAgs1jFwoPfcf3kYq02yIM6b5ey3hT6fr/BckUMSiwMQfg899anocAJ9y3+2i
	 1Th6qeD235DT6ZKFj5eWisg5DGPLeljkgD3f/+udgkOl4X3EV11bShu6p/224Lxy1GH8/
	 rqF/Ooeo3Ta/hrXPEzXigV+kRVCLhMHlNFDM7FjklZHBSls6rLKgtuNl4Kz1HOupkrPrm
	 06kyBNHogRTa6vKRJ0JQgQTdcORtggyOZ710w+fKgNK+rV+vrQ5pHF7om7tbhwnN+1EQr
	 PbMQ1r4k0iTh3+5Uo4CAucQk1d7Kdjbpu19Fb0KJCeQVOw3+vh8m1W43yQxoIog8MWQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pq9F6J9N;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kdCWIjB+;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8B4AA1F00893
	for <linux-firmware@kernel.org>; Tue,  9 Jun 2026 21:46:07 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pq9F6J9N;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kdCWIjB+
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 8B4AA1F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659K4paS3681077
	for <linux-firmware@kernel.org>; Tue, 9 Jun 2026 21:46:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qFIX2VVTFi4DVnoyQLS84Jpsc7A44QKkcFUVZv0stPs=; b=Pq9F6J9NV/cMt9PZ
	zLfGGwqPdajo598qw+TZEKVH1HrqYSxbnGkj0h5TsRYlsYSLbQO9XUczAWA5B14t
	xI3m58SIxIiOXtWSm22knj6jaTUj2Eg04pX/dkxQO7fjYFdeA3nyv3A9143PNm5V
	8Mo8BLy9z/Jr9wEqzHQmpGz3T48zlY1LlGqdkCDDNTypITFgn4BIxtR4YjSXftKV
	SQaN/VLJU+Q4XOL5ZlDe4de30ga0uBsZ4EJDlTqs0x7aNAwusS/x62CfahbCQivq
	GzOguWfVDD3fGlulo4vcCBhiYiG0IVzPnWrxQgc928/ZShktgL2mHy4yKOMy7VgH
	wRkvcw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeeauydx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 09 Jun 2026 21:46:06 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6c7d9c7e2f3so1348063137.0
        for <linux-firmware@kernel.org>; Tue, 09 Jun 2026 14:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781041565; x=1781646365; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qFIX2VVTFi4DVnoyQLS84Jpsc7A44QKkcFUVZv0stPs=;
        b=kdCWIjB+IWdbariA397fYVsx+Jy5SlJvBCeAyqTWo66mm3vRNRHInx2hKoVI+LjPSX
         sY1tUZVx74WYVpMBZMmMhElip9KPWsBN3sVa+m8qaesog3JvLeWoAOf3J6MQwV/yL407
         oEKNNzf2bPo0E0iy+MlLluKXSZ4thak+r/38VX/mRd9mY7EgWRuRSK/xo8cldjDxaxAR
         /rsyOF7fJOd5RRbjeWdaZLn+qr7B8HDOAJog9Hc+onVkWdQUf+HaZStac9wMEm1mrH0b
         jC/ixBtlsznhWncekjJP6cYgXMt0dHFv85TytKYj4NpCU4fzl3bODT0VPW03+dqKXW8q
         f4Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781041565; x=1781646365;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qFIX2VVTFi4DVnoyQLS84Jpsc7A44QKkcFUVZv0stPs=;
        b=azhsYYMBJgYh277n3XamptT/7NQXccoOcw07J2PeG8L0gdmvu0eO3tY666qRj3JjxQ
         0Dixbl/aGG1CmnwrUKfLIIyIEK2n7Z+d1nnQ2NPMY3u4Rr9X/ZrsFWpzYbXts+9NgpM0
         FuyWyLQf9bdT/tJllFvOV+E2V08ZPviLK9rfbJgB8un4jphn/fEDsFxQgWv5AtEx6JuL
         SfHogG9VsigFEWsx7BXyvcAUOMxIoT7SgltVoY87HPE4anpibi7cbMyJFIafFzsGLDrI
         P6ptEKtL5j6X6PNNtrvyU9/e7oXopHIFx+CDhAs2BLq9qefCUcZMk609G6GnBSYQg7vK
         iZ7Q==
X-Gm-Message-State: AOJu0YwH4WXYqjmt8qH8RoOAXznrrsPRkHqFaADcNkViaVJSzvB1dhu9
	1kBXDHEbFS/g7scpwOC1e1T40PM2YdsW9yssnDFCyVOesvP2+OF9PZLzg0gJn8LXECZdGN2YH99
	4pzpUj1HCLUktZb0vtJN6uY2QttKPQwEuY1psUVYjJAtU8pqvr/6DhCic2bzbbMA=
X-Gm-Gg: Acq92OFzdT8IHzzv0ud6Bkkmm1pRDWkHUpBJJg6CDuD4bLsIQh9BuswKMLlfsFlXmBn
	xGOuyhZwBNDuVAC1E8O2TO5ZPpNjhUflB4c2+ROyI/mfOySldQcL2MMg5MTd25j76igQ/zxm+eG
	cQ4iMs78QNwdJZi+gYPi2dIBhl/Fo+JSvdBohWl4AltYa49ke/p5YVBH7vIGk4spy+g0NrrXifN
	aiY7flI8EI8KwF0maTyVi4HtW3172F/llVNZK+XBS/jUIwbaXYBszCSHWsM2XTqMxeDKzJoGxs4
	/Xgo7wMsj4wjIOTPBgeIzwrhLkcALOCWdj3mLgHdYspb5wzkmWXQ0goY1/oKiIwpECHsfCMHwCv
	sAC/5hj1jXkEm3yhkik0M4mQAi79GL8o9J3xMkC2isg2ogP+RRfvLyVBXpSAksV7vGpyx7i0PIR
	e5VCc//dJBcIYAb5z0eZH/juUDq3xoqQsfH1m15Wa6hjGI5g==
X-Received: by 2002:a05:6102:8318:b0:632:b111:965a with SMTP id ada2fe7eead31-70035aec18emr5121383137.11.1781041565459;
        Tue, 09 Jun 2026 14:46:05 -0700 (PDT)
X-Received: by 2002:a05:6102:8318:b0:632:b111:965a with SMTP id ada2fe7eead31-70035aec18emr5121370137.11.1781041565016;
        Tue, 09 Jun 2026 14:46:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b97ac3fsm4912520e87.42.2026.06.09.14.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 14:46:02 -0700 (PDT)
Date: Wed, 10 Jun 2026 00:45:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dishank Garg <dishank.garg@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, hbandi@qti.qualcomm.com, dbaryshkov@gmail.com,
        mohamull@qti.qualcomm.com, samana@qti.qualcomm.com,
        ysiddu@qti.qualcomm.com, dishgarg@qti.qualcomm.com,
        harsnaga@qti.qualcomm.com
Subject: Re: [GIT PULL] QCA: Update Bluetooth WCN6856 firmware 2.1.0-00666 to
 2.1.0-00669
Message-ID: <pppnkufmaqg3zcfv2fbxox6mklo674q2lfwyoxbi3blvvwzrax@a6q2zszdnby7>
References: <fd56f9ec-cda5-4d04-8eb2-d25016a476be@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fd56f9ec-cda5-4d04-8eb2-d25016a476be@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 7tckzCjLeo-p8893idwsN3oI6AdkT1wI
X-Authority-Analysis: v=2.4 cv=Iey3n2qa c=1 sm=1 tr=0 ts=6a28899e cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=p0WdMEafAAAA:8
 a=rWUo3xvQM8ntnenccMYA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDIwNCBTYWx0ZWRfX5bD43wPcD4aV
 lMJY8Edt2I5np0hnbC7vVxBIOZeUPR6u1+8GAm+XRSWbNyYiq6pyoIMWfsOIVhUB95KgXJwmUV9
 cd9aw9C3vzjF2X6gw4wYgiJXPjmzuS3ovDK2kKf0FdkeIOTdqdno5mW6d4ReKwUoWcBynTNCQ6j
 8mqv8brAtxLY0TWOe9WuNwcD1gg2rNP6bmwtnClWMRmljhiFac65fh75yX4N3Te763P1vWDyufq
 R59b1oT8xcr9Tzcb+v5TjdgccqA6/fBzdOf3ulC2MvFwGX3JmcVn91Xu2fqs4S+99eD9rv7K53g
 WAbRE+XDUIdYYWmmab3oabzrGvu4LFBoCGZtJVEm7NFLi/BHsHIcW92EFbJBKd0+Rn7+uuohIO9
 sRw9BRPJSia9sCiVsBpmDpRp9+6MRg39WdLDu+Do+7t1kPJ4PXb9A+KVVtRHupIylTCCzyzYS/V
 yJziu1gYArYYcCzc0zQ==
X-Proofpoint-GUID: 7tckzCjLeo-p8893idwsN3oI6AdkT1wI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_04,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090204

On Mon, Jun 08, 2026 at 02:54:57PM +0530, Dishank Garg wrote:
> Hi linux-firmware maintainers,
> 
> Here's a pull request for Bluetooth Firmware. Please let us know if any
> issue is there.
> 
> The following changes since commit e9504bffad1f551d4e251f5fe184a16d86b3bb9d:
> 
>   Merge branch 'robot/pr-0-1780891185' into 'main' (2026-06-08 05:40:10
> +0000)
> 
> are available in the Git repository at:
> 
> https://gitlab.com/dishankgargoss/linux-firmware.git HEAD

For the sake of the archive: thanks, merged and pushed out,
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1086

If you open MR at the gitlab (which is appreciated), you don't have to
send the email to linux-firmware@, we are getting the notifications.

-- 
With best wishes
Dmitry
