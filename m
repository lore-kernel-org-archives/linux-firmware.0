Return-Path: <SRS0=7LK8=E3=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D750C43458
	for <linux-firmware@archiver.kernel.org>; Wed,  1 Jul 2026 10:39:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8C22A1F00A3D; Wed,  1 Jul 2026 10:39:50 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1782902390;
	b=rhjRHvWtt9SU7nzuK+EgqAzhUmEGRS7BxMB5pnedeEp6HQTPUni6gqrW/9rlxN1SAP7Z
	 FVzvhNC18mIGWqqtwI09wq8rRoWBDbaXHXRjXJ41f/9V2rngYL5oBDZPc0DqZ3XiBQd9i
	 OvxxyAP7p7WMh3uyl69t18sL5D+3t5bqW3xjI2w1kQQ3/TKA2LHwK8HpkyvfPM2FHvhAj
	 LiFwq1MV2S3qhbKt/OYZ8MvFDgGywr0TvXoGjN9Lg9bDwrDT84CEztL12gvlXYjfFWLkU
	 AxanYRiFktj4xehQsiOtMMYsMz9t/5IXX8RO7CxKlJerd/h7ISnOqLBF/i1VFJoIvxg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1782902390;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:List-Id:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8AqXUoCfntTNXG8N/EQdw6clKxKaEE1oBI8q8bKcBCw=;
	b=BVgs/t+d20On5XYDKh3hd200hZ9nIuERPTdiIJUVlQXKSOqTvHgh7RtR5cV9NqMY9sAk
	 GI+EBmrdkr+BGVyReGNvng+aWJLPI03L4dkAcbK5HWlr2/mTeAjErjSSaCC7LsPSWa5Rr
	 /WzSeHpKbLa6MwVskAGfbL522IEfjuHb6vkaCs6P3UTOwvQ9VaHwfkwbmjYhBo7kQr/Mu
	 frp7dc1mAFnJKuyy90aPw79kaU2sEiwdJvtK9bncdGSFEMrocMg/UqoIHPbLSLd84Xvs/
	 NtxuDJJRLqgWJAcnLbM2LI6TIeeO0pEuzVwoyofORPoItaaQaR90deDkbc68LoucMfg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Ga9jkw9/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=it+SuVa9;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D8DD11F000E9
	for <linux-firmware@kernel.org>; Wed,  1 Jul 2026 10:39:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ga9jkw9/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=it+SuVa9
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org D8DD11F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8UmE643999
	for <linux-firmware@kernel.org>; Wed, 1 Jul 2026 10:39:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8AqXUoCfntTNXG8N/EQdw6clKxKaEE1oBI8q8bKcBCw=; b=Ga9jkw9/4FRfnz8x
	nsXdVHYRXUIzsIYhzuUJSbqjjzsCI5TNqeToywcxiafxmj8ZSWi/1pY0JDZPcWhF
	gfWCdXom+OzkEuoiDWGT/mvXrso5+hWqWWSwNRBqpPuYsG5rEZgZdsiN1wz50O2L
	cFjapwIxSi0GUiCDyCEx/BJc5a137dKVtbv9Dia8CBL08q2pYSDicLvo5eelTxlS
	49Ewg2Lq9PVf3+7c0yLVjQBROXFZ4BqXOFHPHmg15XATv2xodEyg/CT3h9c1GW5h
	uEYa8Kf6Pj4hBJ2QQ9Styj7kYZQBbKdzKuUSUZggHvUXaMkSOSubdHOli59pG635
	60cTEA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4hbd4bh0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 01 Jul 2026 10:39:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915d3261c5cso45522785a.3
        for <linux-firmware@kernel.org>; Wed, 01 Jul 2026 03:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782902388; x=1783507188; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8AqXUoCfntTNXG8N/EQdw6clKxKaEE1oBI8q8bKcBCw=;
        b=it+SuVa9NbY6S2XPtvkUUdueQMhR6o7Or4iOEMdqs8OHVeVEatgz8zVF3KaCxZKuCV
         XzJ6I7fUeYOozBYUKcCzGNHBe8Ko1Eb91TjLAsnaFkOG0f1DjjbpzJDkP0XB3Yk2Ob+n
         L/rj0+k5nfCD32Be3GccMhzOPzqrV1+3sKHyOps5kQ+5X2K9TeTZScUC725bdBXapG1q
         4+rQulLxCHdWvgCXrERFYXk+Ey9fjkHfXDt6hMja3bIPQkulhpf+wa4fxSxK2VF2jHsU
         vx+GVrwlgKzHjzogbK5LVk75urpUmdOmtPz0Fm7E0pxu4w6Wjd3rLwCz3lGwdB0xifcC
         nKUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782902388; x=1783507188;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8AqXUoCfntTNXG8N/EQdw6clKxKaEE1oBI8q8bKcBCw=;
        b=R1QKgdq9TUwoYwEnNzFQdKwBAUMMt/8cU8iLkl90/QanTZBm9CAZiaBQuAGdsqn2Hl
         Utc8b4qAas2oa9+mmRzVYzkIApdZjozhauUmuHXaunnMW9N/1Gvj0fZaYa+hzvWh8hKi
         t+2jc0cuZ9Wb2nQFKFuphr2M7Fr4y4qVpPqLig4boViNLM1bi3S2M4pGy7Ovfy1eC+ry
         8hfWw5Y8fyFhwrO3fDVkowxfJBII684z+6goxMxd44XyWi7q01B6WimIHmuYsnsxRZKC
         Gtx4nJRl1Fy4XyoseL+8KptVqxXoQ85XXjik7t68ysy8w1itnry06ahG3NNlD8s5zJsF
         Xmpg==
X-Forwarded-Encrypted: i=1; AFNElJ8QXxAw8+Cqmd+5gbk44JezTMXWJjQdheu41gqhLd7iy/C/dSmt9MLfJIP/WaZrMaQF1lQZI+4JeqW5uZBWqw==@kernel.org
X-Gm-Message-State: AOJu0YxPauGB/1gPp7A0CebOzkptTHB3iMV+/gzKkYy5ndp1k8jsONKx
	bPmYu6n4aBMMte58wfKJD1sZ8YdmGCFRXWSyDFaNqD6EYiVee4uLB7g+SZb3rXzhnUeNRqe7iFI
	/+D9f/nfSYkC1rjMjcmA2ZovqlZcoSr40lf5dOhTyPuTpM0ElX3sRLdf+VZqQiJA=
X-Gm-Gg: AfdE7clIjKFYoSVcinQuxn+JP+TAgnzpCUDSgndOFXprwxrEwASNij+3ybpAap80CL+
	uovm/ioQYTNyUpcTJhkKxioFth9rZLJvCzUUbJQtXFB5CfDXQKOE7O1gChCtERLE5QM29dd3f0B
	8B3mQMsNP5gCSsF/s5aX6slFVWYl7hqjQF6HkqlorrY+QZlP1JwYOqkH2F0LQV9axCPU9MuO5Ep
	Qz5PdvdLaADsDMXrG49he0rSBnCdFhKdfZ2Z3u8Uc8KegufZiBmZJoBazliiCQMqiM18WLytu9O
	/mQUuSTkzvdXbPVH8vF/qiiI++llSjGz643aLkoZZCRtnCJbAqBfwGww8U9DoD2VnUARZUPxoeN
	wJFP23Y6Ba9Z2egOGGSuSOhxj7GDpQk2Nemr2B+HR0NcL5zfJG2bEsPESRFOooC4RlXP8t23bUj
	biNbwRHx+zVxC3jp0Pvwi+2tO+
X-Received: by 2002:a05:620a:198b:b0:92e:74f6:ddd6 with SMTP id af79cd13be357-92e7b0546d5mr40713885a.25.1782902388082;
        Wed, 01 Jul 2026 03:39:48 -0700 (PDT)
X-Received: by 2002:a05:620a:198b:b0:92e:74f6:ddd6 with SMTP id af79cd13be357-92e7b0546d5mr40711385a.25.1782902387643;
        Wed, 01 Jul 2026 03:39:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec2a7bbd2sm474738e87.50.2026.07.01.03.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 03:39:44 -0700 (PDT)
Date: Wed, 1 Jul 2026 13:39:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Srikanth Katakam <skatakam@qti.qualcomm.com>,
        "linux-firmware@kernel.org" <linux-firmware@kernel.org>,
        Dmitry Baryshkov <dbaryshk@qti.qualcomm.com>,
        Raghukanth Joshi <raghukan@qti.qualcomm.com>,
        Raju Panga <rajup@qti.qualcomm.com>,
        Venkata Kota <vkasinat@qti.qualcomm.com>,
        Komal Bajaj <kbajaj@qti.qualcomm.com>,
        Viswanath Kraleti <vkraleti@qti.qualcomm.com>
Subject: Re: qcom: Update qdsp6sw firmware for shikra platform
Message-ID: <7w7admbc5r6v3boux3kf262e6augklaxgu5sxhipy7dyr3pbd4@dldsiul6iatn>
References: <CO1PR02MB85698F560E017D2B9DAD0B31F9EB2@CO1PR02MB8569.namprd02.prod.outlook.com>
 <uppnuvd6qxtusromxs3yk4e2bl3fe3s2ab2umtusz2nnmfzs6h@ov5sltjdczld>
 <CA+5PVA7JP=BuOHfbPRQ=aQ5FNXgv5gY1KRj+s1emaz2=rSyjaQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+5PVA7JP=BuOHfbPRQ=aQ5FNXgv5gY1KRj+s1emaz2=rSyjaQ@mail.gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExMSBTYWx0ZWRfX60uO5ndMniFx
 C/Lk7Q1ghXg1k70maznAaXl/eOK1XoavGcH3CpLMHQmitlMC77nj5XVy3V69wGNO8Hm5EqDab92
 mZHbsF6VJoqcI9qanNExx/d+OBujr2Q=
X-Authority-Analysis: v=2.4 cv=MpJiLWae c=1 sm=1 tr=0 ts=6a44ee75 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=qC_FGOx9AAAA:8
 a=EUspDBNiAAAA:8 a=wKvwwe9-iEc8xjVMYyQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: htv88glgEE3M4MXZY-sIbIkyCeHRibHC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExMSBTYWx0ZWRfX6ZpOJKo3ZiN6
 3Y8vKv9P7vhvEg/J0/NpCjIAzRM7kJbCp8QwDw8RFWAv1/pUASF5jNRCxL/dIusoSdWkubJ0Ff7
 wjK6bqqzoK45GYpeWHnZa6uWSmai9kJziDObuhCuOSESEEwBhL3d8XQSnc8tufpcHmKZwPP3ciu
 frPlLwwnQMofC0ZuVVnAX+Ype/npF8q88wkVV281XJyuDwuzU+oq5ISAmXNqCM0mcWnObgeW615
 U3QtnRuZw+PkWDnTFVpP+ljnxkdtYN8xLpn2vDegzTaFymF+Ngo483K4w5LLmlzXhCrt9tte/z6
 UqjoEDIM4TxZ8rkZOQmJU4HBqyndu4IpiH5GCfd1LIXzP8CZHQjc80vmo5UbZLKezuhwDf1bwcU
 TDDpMH9S7WaL+O4gcwnbYRwao70LwmuIO3ZRoAMNhv64NoNqbc2tWS9itg09naqYN430tGUO73k
 OVBHoipXTXkPsOdWpQA==
X-Proofpoint-GUID: htv88glgEE3M4MXZY-sIbIkyCeHRibHC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010111

On Tue, Jun 30, 2026 at 02:35:00PM -0400, Josh Boyer wrote:
> On Fri, Jun 26, 2026 at 4:22 PM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Fri, Jun 26, 2026 at 05:23:50PM +0000, Srikanth Katakam wrote:
> > > The following changes since commit 1bd9b36771d9087ea76588812995587fc0024245:
> > >
> > >   Merge branch 'robot/patch-0-1782476710' into 'main' (2026-06-26 15:53:01 +0000)
> > >
> > > are available in the git repository at:
> > >
> > >   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git* modem-fw-shikra6
> > >
> > > for you to fetch changes up to 396aad69556b121575078264d3c59661ccc53744:
> > >
> > >   qcom: Update qdsp6sw firmware for shikra platform (2026-06-26 22:26:52 +0530)
> >
> > This is still being ignored by the robot (as was the previous one).
> >
> > Josh, Mario, do you know why?
> 
> I don't.  The bot runs somewhere else and I haven't tried to run it
> locally.  There are a few other common senders where it doesn't pick
> up the patch/MR but I haven't dug into why.

Is there a chance of getting any traces or any information which can
help Srikanth? His last pull request seems legit to me, but it still
wasn't handled by the robot.

-- 
With best wishes
Dmitry
