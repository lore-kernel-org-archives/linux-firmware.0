Return-Path: <SRS0=ZRYJ=GU=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D92C61DB9
	for <linux-firmware@archiver.kernel.org>; Thu, 27 Aug 2026 22:45:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 014381F00A3A; Thu, 27 Aug 2026 22:45:28 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1787870727;
	b=ApieVDjZ14uJRCVyRB8oJ4JSJcXDuAKm2ObtfUq94dXN7vuFfEuw1vjLcTjZqCEEUNAH
	 W5YhVj1HBg+41hDB6P7yYrrkOXh15M2tOGMh79jCZAqzZ7NzJZAWkjpMPo+8/NClyGUYK
	 1o9gA7E5QYwWE8ncUHOnh6YszXoH9HaNOeWTwgZqx/XM7qlMezVvCtMr7+FczZZNhZ586
	 WZoKEgNBsTAbPPy3Xcq8GFTKyOf92VsiAVFmfAdKIHoTLPOpI0+xp33DtxpyKAA2iZiCF
	 f7pWgP8njS818u/k0OxKTufo/OVWALFMSkQZ2G28O4KvVBFL9YjJOcHVFJTGDMVQWLw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1787870727;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=saBDYvA3e7EUsfsNNMoTxOhNga7Xiyks6X6gKRCi23Q=;
	b=CvcnC2p0OP5P8Tf/6PydwrUgVxd4MGtRNesVqiM91sVn8vbMxkfPh5No5PTPej85NYsF
	 f1jwOJ0kchc4Kpn0qVBH32NsMZsziOFOGPIDldO80kQhKxJMCnYfrxnyv8OLggulS8W4P
	 j7to5LBgmCgQWrDywoSvM2up3xGEWiML6ZsH1nvszW35tdEeaDa3E85NXMeQRL1Od/oXf
	 SaCJhwsq1YofYD5XBF6+F1HEyDER1NDYjgVLiVFOY66euesaQadsCQ7BC94UYRY6sTFL5
	 UsruVgd1YKpWsvrV/mniOkdTsYtQFWlSGGRzCrnda6rd2lJRUIYFL9Zw1m1cGHpI38Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iHj10Kkx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AsoFTVDb;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 571821F000E9
	for <linux-firmware@kernel.org>; Thu, 27 Aug 2026 22:45:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iHj10Kkx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AsoFTVDb
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 571821F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RMdrmL071803
	for <linux-firmware@kernel.org>; Thu, 27 Aug 2026 22:45:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	saBDYvA3e7EUsfsNNMoTxOhNga7Xiyks6X6gKRCi23Q=; b=iHj10Kkxqvlol9IO
	dHxbwlkqhpMzYspQbpIa/qK3ZxcwgiIcAaNdX8hYsXfWQQB0pNBsWlJ0Bfljvqe3
	UX6n4+8OyokJ46/vt5Kk2FskFiGfsVCd7KefUPdZXlbTc4HrG8uFqiwsEg+SHYNa
	mRxgHn/Y840m8FAF+5GkQvQboi+c+wGo09mS1acWUG8cd8mzXsEa2s8GzJ69NuPk
	Au6BgTohH/gqK4aJxeNnofi/Cv3vAE+KGmpWFKOnN8r8C0E5dXwDM6U6574zidK7
	S9U0TpbDNAtitLqOnLoiDpLM1YsZPFUJAjJnzjCeRNC4dFYnmxjE5wAFCgNif1Jp
	C7o6iQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gatnc0wh6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 27 Aug 2026 22:45:26 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c2cd8c6b09so193593e0c.2
        for <linux-firmware@kernel.org>; Thu, 27 Aug 2026 15:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787870725; x=1788475525; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=saBDYvA3e7EUsfsNNMoTxOhNga7Xiyks6X6gKRCi23Q=;
        b=AsoFTVDbnyVP4dXGYfcTstb1QtOV3glHLtY0s+8I1NzVA6PQ14/Bvy98hdkLpR0Maw
         2qLCJHRIDlH4QxGPf90GDZP3CEeg2PsUA0tlTmNqq5xglWvF73NIR1N1fIZc5eyts6sz
         RFMGyV1f7RoNn2RVxzA6hxjJN13uGklGvLvkgKYCaDR5Zt7kU7KLvuq+wWH0Kv7quscX
         gTV/G8zz9VG0NWAbkEGfoNFgzR2T7qgCflTWfzL0DXKbVql7Qz4QOBe1WCFRW+cAyJD+
         RJf92zlq+6hJsBBaPQ7D77OhrMXpEEvHq7Rqf3y+hdUZRrCCIaZL3t9Wm7Hi7dk9GPzJ
         CddA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787870725; x=1788475525;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=saBDYvA3e7EUsfsNNMoTxOhNga7Xiyks6X6gKRCi23Q=;
        b=psh3K/xv4DrgyT3pEy/4+yukKlqgYJ5dLlTgnslVogTTUtCuBQ1ObbSl23C6HmXaif
         6lqShvwbKh2cUsmQnDvvFL42PQUcvi53kMi4nuMGdfcxe2uhyvMcPHJhzHiRrWN4kHRL
         +LkVSGFzNq/Udeer0i1lYW+UwUWOnt2yY5FV1yAGYP3aO8IBE7R5OryhDkzD0TiMOcCZ
         QYUxC9LwQvArmWveGVQeWdSvog/CvIvD6K18WYhUizyoxmJ/qIa5mHbRHWfcrEOhs/sC
         hv0ynviircpVZsWMNIREOZXBXzlnZ9ceQrJRRBvvHyZu3znhlZnRbTkGj/6/OoX/YdtC
         qa8w==
X-Gm-Message-State: AFuF++lUMwGflwtqeKzz8Hv1Sf6WbaTU6nxZ2XAdSWMcB1kDLMNirf59
	6x9BWmQ5/4P6aydrka+gtaTozBypqETCxORAdBZC4rbBDH6wLPbRhF8h5+TsYSRCcZxrFi3BKVp
	YWDerXSo6Ooqsccvas5gOeBuj/cF+xoM8i6W5O7+ZvftRtAh/Xj8Tfr9U1ttC6Mg=
X-Gm-Gg: AR+sD13K7rCsmKl0Ub+X0uVa887aLg5uGcHF81Ecq87+deQxA1vrwEniDUaUfcifA/S
	joR45VhOPbyGB/8Rxp+iEkGWiJQGWVlbegD2rmaH7Nmhbhv6e1FLab3vSrZs4tEUqZxPVObNjj6
	s1q9jw9ZcIkKvgv98h/L9Cdnrq3IErK/qanlvXp9hvKNMljHHb0atzRoKi6YxTQ/SzBKScWIjOW
	+Voa3LXPt4tluhDkCrT01zXX0XKjRGVD/G9LU1QIYUUH9XgQC+j2yT/6//12+DtC6p4NT+o4GHr
	OqzeQ4cPKAFStVTzSGrYIBJXXlX3Z4hvwk/XY7FenlaU4FgjLne/5fustgJK0cr7Qr+1k+Z6KCU
	3ldMdc9RZDXLJLPBSmgDnDBp0ztDx1MeZbMHrvwvzYqlzSGdDQ0j9PDcfbLtxGRa+CUtnKuRFCb
	XbmKfQ50pj96SB
X-Received: by 2002:a05:6102:3e83:b0:779:c38e:de53 with SMTP id ada2fe7eead31-7859956a1cdmr846447137.10.1787870720284;
        Thu, 27 Aug 2026 15:45:20 -0700 (PDT)
X-Received: by 2002:a05:6102:3e83:b0:779:c38e:de53 with SMTP id ada2fe7eead31-7859956a1cdmr846261137.10.1787870714927;
        Thu, 27 Aug 2026 15:45:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a2e6052e5dsm5978321fa.4.2026.08.27.15.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 15:45:12 -0700 (PDT)
Date: Fri, 28 Aug 2026 01:45:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xueyao An <xueyao.an@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, viken.dadhaniya@oss.qualcomm.com,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Subject: Re: Nord Linux-firmware: qupv3fw.elf
Message-ID: <mryzr7xff5blqn62lplpteaxidzqw5imvffamdtexbboxuew3g@nzbygtclpl2p>
References: <36e1b825-7896-4308-bcee-f695149b3c0b@oss.qualcomm.com>
 <yoju53omp4qhbhjix2seufd7beyjegbnzjinxc2wtljexonfq7@6fgc7d7ckyqp>
 <f4ff769a-ade8-4fa9-bf26-9a5e58b34285@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f4ff769a-ade8-4fa9-bf26-9a5e58b34285@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE5MiBTYWx0ZWRfX4zlui5y3TkZ3
 aoWlfPBps+1lsYXPwwtgZ3P2AsUZPIjkOC40VUcZjW9/m0Z8yxCJte5mFnwVJI1ZJfNBrN0MLXF
 fmnEcdUyKeBzD0dTEN6SCzW01DwkQGH3Ne6OyRaZRiZWzodcsvCTOn1fWiDm0oJn0076IDpYR+K
 dPQYJIVN9BjF7aDRwV4yySJPqN5Dh4UBEXnK/mbiF0101RdLPI4GADj6XMxZreAl9xN3nGb9FVX
 BA7EfRWZFFGfkFd6C7SVMDaodpeg33nud4uCY06IBjM54k2rJP33lCEJWYPcJWeKXJwjhjC0i5A
 Gb+FFU59dSjcb0rvXOF4oVuUdITBMLzlMbMFbXLB+vhNneVG0Teqg06pVVlVT2EmA2ZyN6KRuam
 OHywWCKc1K/p6oLq9VOdNraimpDIi5ANtfs1iz3Qp6nVvmbnuBgueZVVd1wRQJNj3ACydEnMoM+
 G+PKkxGUQle8KKaTnfg==
X-Proofpoint-ORIG-GUID: eqH4UqZjgZYCvESrxVYZVyHJ7yUc9VeK
X-Authority-Analysis: v=2.4 cv=HfUkiCE8 c=1 sm=1 tr=0 ts=6a90be06 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=qC_FGOx9AAAA:8
 a=p0WdMEafAAAA:8 a=vN6RXr8bCuwwBe609isA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE5MiBTYWx0ZWRfX2i9FXF4AfCfT
 mdQPWwdcvslVOeKBqf+yYR0FNtYeIKJBpkg2Ly8tIGsDHaqA3xfNyjdWHOVdsnSpwh/FzgPGdwQ
 AG0zaCIkVgZP5FKLbJF2pVB930at2/Y=
X-Proofpoint-GUID: eqH4UqZjgZYCvESrxVYZVyHJ7yUc9VeK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_09,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270192

On Thu, Aug 27, 2026 at 01:44:03PM +0800, Xueyao An wrote:
> 
> 在 2026/8/18 8:55, Dmitry Baryshkov 写道:
> > On Mon, Aug 17, 2026 at 05:26:08PM +0800, Xueyao An wrote:
> > > The following changes since commit 583d336ee7c2a15fd9e92c223b147d30737ec04f:
> > > 
> > >    Merge branch 'intel/guc-v70600' into 'main' (2026-04-02 18:58:02 +0000)
> > This is a commit dating from April. Since that time we had several
> > releases and a lot of commits. Please use a more recent base (Gitlab
> > points out merge conflicts with your changes).
> > 
> > > are available in the Git repository at:
> > > 
> > >    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> > > qupv3-fw-nord
> > You are extending the entry which is mostly sorted out. Please keep it
> > so instead of stuffing your changes at the end of it.
> Thank you for the review. I've rebased the series on top of the current
> main branch to resolve the merge conflicts, and moved the WHENCE entry
> to maintain alphabetical ordering within the existing qupv3 block.

Thanks, merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1203

-- 
With best wishes
Dmitry
