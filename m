Return-Path: <SRS0=aqNB=H6=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A72CA600A
	for <linux-firmware@archiver.kernel.org>; Thu,  8 Oct 2026 07:46:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2A7A01F00893; Thu,  8 Oct 2026 07:46:44 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791445604;
	b=IJ+Tq+9qMKk312bSN2Dz2cbYqTrAEJraN/C9oUeE7x6m4lLRGaNrTv1VDVRQCgetalUG
	 tZQoMyeWGW07hytNW27G5YZ8mtGzw3xswKAo8g/eGWp3LUyignZZa+STrdqwWtI0TxP2Q
	 A0iAq0xHUHhfz+zMOkNFXRE51xXAflDCKXdiKT5nXkleolcgU8Y6H6z67MbjqfpJko/ct
	 i1hDtgOkWzVHhO1/xjR183DMwTaoqTemDFiQ2keOKWo3l+xpehKaUkqNXHeSph6phuCwx
	 m0822TyfveOu4dhH5o7ZhcxgzEq1zvM1BTT2eC0KDvK/MADi9cItrI8kjIU5vX9+QXA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791445604;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ryqWJyIZETtb8yyHvWWNPOSDfAd5QtucUCyxdB7DyCo=;
	b=ZMSanpm/ZsvyWdE96bqnqy+ZfRxL9ZU3TGglbQqTUpYa3vgvXsbedVnIzHVLkX0ilfVi
	 Gt/lPXnG/5YpTiLWKWU9Paly5TvbZpMH+rsqsD/ZMf3/uqU66Lvy0+vKe1znfLDy32hu4
	 yjMzHn/6KQA+lakUqub8b8IIZ5oJWa4WiZZYNcUE5Nu4Dv38XsutYR+yNBdHc+RsUeo6E
	 3yaA7rE6DvnP712bvnCd0pliDy0PtbjpDxs0FRqY4vK94KhW6A8vmhET3yZRUKBdM1A5/
	 6cAF9pD2fnbKmEDCq1YeTukJ76YcfEWw3clcpwQyokBW8pMe8EI+6uCk8E1CKzYpsqQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mvkWjSnT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UxFAp1z2;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8A01E1F000FF
	for <linux-firmware@kernel.org>; Thu,  8 Oct 2026 07:46:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mvkWjSnT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UxFAp1z2
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 8A01E1F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KAol1574590
	for <linux-firmware@kernel.org>; Thu, 8 Oct 2026 07:46:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ryqWJyIZETtb8yyHvWWNPOSD
	fAd5QtucUCyxdB7DyCo=; b=mvkWjSnTl3B+W5a17x85pTaQv0mjwm4nA8dRpCIC
	VPf9O9ofw+h2zVwolJlOUdqAD7nDv/eg0bdZAcQORtD9iSpKyUdObDFSBUMZskNu
	QQYQ+78Cx/dHAzMvTgQHgoSMY9S9kfl4erVV2QOlwCW6+LYqtmOS6c1u/RJ2dYsd
	7WM6eyW/N6exRgbtvFwMK35MMUx19IyLe/GV1jir5HwNHPtf2ot3SiPCG3GmDa15
	TvsbOwylJGp7xrbxX12wlOGtEoxcudee9kUThqjZIj1bBlXTG9biPXLdNiEZP1eI
	8gHbU+6jSnPS8U7pLCMEHrdJj9xvKKIAuUQdViEJwEMICA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe51sf7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 08 Oct 2026 07:46:42 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91235881828so108351396d6.3
        for <linux-firmware@kernel.org>; Thu, 08 Oct 2026 00:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791445602; x=1792050402; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ryqWJyIZETtb8yyHvWWNPOSDfAd5QtucUCyxdB7DyCo=;
        b=UxFAp1z2BLNakd0rYQlA1/bzRp8NjMV/io6Eo7kUA2+NQNDh9nML/KgO6gj2VE7PKl
         QPz2bYR88bSC4pRJVKA6UIqegxPE4Ew+hhI7Hu6UBQ9FEDQTuyRXF9ggTMlRsdAarzcd
         tuVMo6LGIJD+HJMSE/ne9IAzrzPb7uGWQtAQelVljBWz7P5G9uS9gzMgxxkFl7eJLs0a
         FS+WbMzjp/NAoY0lZ4qle6kiMLmdJvsbMdm2l1eXZHqiJg4pdiborRceczeVSO6XKAyu
         HAp2GQVHe95EEkEYF7YzQPvUgmFSG3hyoAFGa3XvvjSfFEdqlqsMlUM4J0jVh58GaJrW
         zNCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791445602; x=1792050402;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ryqWJyIZETtb8yyHvWWNPOSDfAd5QtucUCyxdB7DyCo=;
        b=GVu6f4bCFPOoZ715BIbpBkdTEViX7iVULpJrL/c/vwWx/JuAYewPEELB0ZqR4Kwcoy
         JvvLA7lKuySYPSq78OsIIVK5BEilyaQJPh9wYcghAn73pXPAu02mAYdaa0U6fvTiybZ+
         RRkkFSmvY5RpwWXli+AL0Fn6isjZPH/VYhXk1fhspgB8Ik3wzXG8AXseeN4eqZfABoZu
         ClHFK6NqjI8q1HlS3R826ERJRCR2gu9TDodXUjHLwcZYvshoBI53yGTzFiuwL7p1cLpm
         CQCB6r3nGVjzFZoisfBnsPWoQIQLgW2/4k5kC07Z4BfEBiPK3gCDco/q8WOICr/X+PBA
         Ld8w==
X-Gm-Message-State: AFq9FYLh2sggV1LNnov/DP/DDN/pQ526L/jBW/3SjuFtQiWjbDEf2QYx
	NBdBkHlV3GHIZxNYIYHbFysnKwuj71kCvdnCpxpjOF5/Zhd1O0+VuqFPrwo7bU4g/ueJXgAgwEv
	XhPv9kM7C/vvQgOKUsVsyplxJyaoyGd/dIo8yabYx3oQlW1Vj4YXVTQrJ78hNqhUI65fDjIuW9Q
	==
X-Gm-Gg: AYBFou07/H7M21/6mw7mJK+9b9C5K4IOoiq4JxA6SxadNBHKn04IvR7cAWBhNK8RofK
	KQGT5zup0jdV/JbRGvn+baXRMi/Dp2wtfUWCYufkla6wIts4gV37ImL4p/se29b2hrYWgBb5mq0
	Jw7krPpUWzhXyNgZypirizn97W+mxWWQ8rTyuCZlVPBSrgcXcKxwQB1vKNwtclxRfoVGUdLoODT
	vvKRr23e3TkN8nWeoDnRvrdZ3o/9klB+fetMtvGMCs0sF1MWSGsMqIBma1rFoBXsmpNQrvzJ5Jc
	mkpIxgDPwvg28FP/XKAxloQnf7zZgyZrRzXBetcsEu5QVM3j6C+ASzNatF44dpO4X769TRFADDo
	1sicKkkiZ8FyIhZB6QmEnyfRy8rsyPsL/k8ltrAqcGKStD1cR1uy59WlK2+FfAUxy3iiYPxPmPW
	RGcHNo2TxbO1cP
X-Received: by 2002:a05:6214:3f91:b0:919:89f4:64d9 with SMTP id 6a1803df08f44-9199782f2eamr78425336d6.22.1791445601782;
        Thu, 08 Oct 2026 00:46:41 -0700 (PDT)
X-Received: by 2002:a05:6214:3f91:b0:919:89f4:64d9 with SMTP id 6a1803df08f44-9199782f2eamr78425006d6.22.1791445601319;
        Thu, 08 Oct 2026 00:46:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9a1d33222sm13650561fa.12.2026.10.08.00.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 00:46:40 -0700 (PDT)
Date: Thu, 8 Oct 2026 10:46:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Saddam Patan <saddam.patan@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, venkata.kota@oss.qualcomm.com
Subject: Re: qcom: update HPASS firmware for nord platform
Message-ID: <arxtjcj7y4yea2l2k3l3dknoyytn3aazhv2eaemnzl4ay4ayzv@z2c5l46k2yep>
References: <c219edbd-beb7-4259-9167-0a0e2168b5bf@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c219edbd-beb7-4259-9167-0a0e2168b5bf@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: NcY7lQEVueCrYZGCq4eOSStBkqNtdarB
X-Authority-Analysis: v=2.4 cv=E4dYNqdl c=1 sm=1 tr=0 ts=6ac74a62 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=qC_FGOx9AAAA:8
 a=vyXeGSww8-Bjh3moARYA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAzMCBTYWx0ZWRfX6HsbptlhtoeC
 mhrbw2p8v6hI/EpBOuK0R4ruuKNmupQ/WWCclOkikS+YEZR9pZFbTIoaP+W5W4Rnngas/eQ2vli
 w2Su/fLOZ93UovaoO2ZIQ2KTSbjLmXk=
X-Proofpoint-GUID: NcY7lQEVueCrYZGCq4eOSStBkqNtdarB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAzMCBTYWx0ZWRfXx+NsuROAYqZF
 w0cyf3P74kWWq/ILBvipGFV4rLaxQQ8o9e0nKjiKkdbC07yhWrPfg8eVzeZ3CQ+Gsgjmx/BJGDj
 EGd3HgRt3xmQTHqJq7b8jVE9bqJBg36sVwi0B87dUjCXchgS5oMEtEnUgtf6CakZw5mODicDuIY
 db0I1a9UXUI56/OOdVZ9ubPQqQQv0Zuj1SMzabkUQlqDz2bq6RCnH0aLMd5+M1K1NWPNT04gPuL
 p1+ecfh4SvL8x0c6nxb1yMxto4M3rfAWJa2gAL5HxgcXXwOS6jmofR5w/37H+zGecUh+Rd+nB4l
 3Y4PdP+EVVYF0i3wECjOppa2DMGQHnl63wuJrbbnfo24Jo7x5G50F498saDRbaJYHAKR+5HLfmI
 VGxT/hyzCdvs+M8IA/YqX1fze2mzViaLCotLOA7FCLQ6kDZB/5JdCnVWcZeNULctidXiI6w1N0G
 Yj9ih04NiSO8t83Gm+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080030

On Wed, Oct 07, 2026 at 07:23:00PM +0530, Saddam Patan wrote:
> The following changes since commit 24247053afda2bab6b4ace42402dbf9f3b1305d6:
> 
>   Merge branch 'arch14-8' into 'main' (2026-10-07 12:01:52 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> dsp-fw-hpass_new
> 
> for you to fetch changes up to 5821af7ef9b4cd96ad1d9f9a11d5041ae4b02594:
> 
>   qcom: update HPASS firmware for nord platform (2026-10-07 19:19:58 +0530)

What is 'KW issues'? Think about Debian or Ubuntu maintainers deciding
how critical is the fix.

-- 
With best wishes
Dmitry
