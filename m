Return-Path: <SRS0=l1EM=EH=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16706CD98C7
	for <linux-firmware@archiver.kernel.org>; Thu, 11 Jun 2026 15:37:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E91891F00898; Thu, 11 Jun 2026 15:37:52 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1781192272;
	b=zCYlG1+rwRLnpx0CvZz4sWi1IEt1oJMz+noPCtTrFvoiMRmhmg/hK7wJ+PFYgDRNFi08
	 XZ9VvZCzOYy2mh+CAd7zF6GDubijFkY298AssYh4+VI+MGUSk7j53k1hb2NJVojfkYzR5
	 hxfKAwfK2lasreT8GLvJlzVoXhsfrY9Vy7BzAGy2mDZzZZMgu2urkD6RoKGJWF6gG43Px
	 E2TFvwU3cHsjZy2GLrxAiOEbSzxJelHlWyJ1zRXVN1PimuhET+8PES+m/U8knVLJX03+i
	 Sqra4umVRPWsw+TZpG6NCW5ADYT/Evn3a5+uxQ9l1t8YeJRBVlvyZCIKLs6plcuAOuA==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1781192272;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:List-Id:Cc:Content-Type:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NYtgTeWcoc8nja2j1AnnQPehO+Fjn3oPCQzHh+zJqts=;
	b=azXreOQubS8vDBwNo99+Od3bDmg7+U20DtpkNiGscV6i0MzfiKKTkCMsuXxBHvjesP4X
	 HRP+bzuUmfxyMxDuoGO6LrRfYCSOsLFpOKmEelnZUNdLygoOdruxYoRS8Q4Qmd7jZ1Sat
	 /K62F2CWQHVRymimFzaZjtWr9I+JS3sO1QbmiEB0N0ugRuOd8dI4L+Rw30HFwGsB+Nbtx
	 QmRuD+I2gNKdUt25s5zqdkbZj3vaGQ8wxoYwuEJXEwIi92V0rF1StgmrcSfBAtKE4WsHF
	 q0WLgwnxUIpx75DXuNrFW9z0DtxrW62WtFcgMgdaGggaI3iYrv3o/hHtpBwFU8URhwQ==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MdMD8jXR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NfvbzHB3;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4B4C21F00893
	for <linux-firmware@kernel.org>; Thu, 11 Jun 2026 15:37:51 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MdMD8jXR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NfvbzHB3
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 4B4C21F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BEs1EN923072
	for <linux-firmware@kernel.org>; Thu, 11 Jun 2026 15:37:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NYtgTeWcoc8nja2j1AnnQPeh
	O+Fjn3oPCQzHh+zJqts=; b=MdMD8jXROR9BgZfLGhVHecJSYIuTsv6dLpqvOQJc
	rd6Btbktaw0d4g5FtPkw8l5I5oS8VfbhYIkkRDybgfJ9pviubgTy1S4sWMfhPOb0
	N2iYzimBJhYKNSvRh7QTvyw30MJBNeJdKJmqXerUfUKP5S82KYmL850jWoGUfxmv
	wJ/DefJOyD0HsDrlvlonCpnYU5xZg9VHsoS6zy6JxkGCDb2PQDFcKiU61jm1lDz8
	n1YrWy2zu+DQRCJ/xVI24XuhfW36lvLTmPmFuTCf8p6D+598TY7DRwzNVWgNaNvG
	+PDRYNDbVVPLFq8VhGoAvqx9aBPqXVxZ8PgiRCqZRQZIRA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6uv7f3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 11 Jun 2026 15:37:51 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-842308adb3bso49061b3a.0
        for <linux-firmware@kernel.org>; Thu, 11 Jun 2026 08:37:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781192270; cv=none;
        d=google.com; s=arc-20240605;
        b=PPeH+rKTcnqRPTxWZcorN4wnyikIiC5myJO0QnYNBzIhqJZuLaNSVzKyr+e8fcoFIN
         Y31vftqr2k7tQFK+QjqXMNxXyY4vHp29ztuSQz+Whd8uHy1NGp6jziH9f3pK0T7EEt6D
         t7giHfyVHX6rF/1uXF8L24gLO8KENGbRf1MXnsu9/nWiVu11uKuUmTrPu5OZs7NNKVAY
         LrkbOCEO6BhcTBAtwTEDTb7uMiFFnrCiTqHQvFusn88UyNrKMORahiTJgeUAUS6pKs1t
         7L44EfinXAbzBJvuP4k93ZOi1Mgbpj5EtBH6vNrNwQnTaMygpR2Z0omPJDS6Zk1oov20
         AUrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NYtgTeWcoc8nja2j1AnnQPehO+Fjn3oPCQzHh+zJqts=;
        fh=0hZIwwxU0IvdnU3puZRSUu8SPP/I17IT4iH7elxaJEY=;
        b=eIaGuJcYKx1xe/y7qLlDxWy17yipbd7+D7NhqA52gN7oSRQzlLlfkmA6qDH/pbH2YU
         PwRZURYXF10vcRLjqVZAW6ciDDo2aHrE0brYJaNeEyzhbM1x01QvIsjRHFen0u0tvvRD
         or5WN37mPK1p1pj631vrRLYOUm6NeVXHJzcpv71THMB2q1rx+2eHms8CITBF7ptucvSD
         W4fdxUMf3Gb4HnmY95l0xWV1kMiQ3eQDbvRnaWCxtR4gJypgAVgNNQheyopKuswn+Yn+
         ABXVOVipECZRRO4DdPOo+8O5lfwF7HciFbOon2/1UnUvpKot1zDC6Au3hM8AXMFh0k+I
         l1vA==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781192270; x=1781797070; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NYtgTeWcoc8nja2j1AnnQPehO+Fjn3oPCQzHh+zJqts=;
        b=NfvbzHB3IG9DoLySf2PURQW+V1WLrCFn9vzM3zphUHhTPQy9yK5jbkmNgrqQPU49Zf
         3AR/qb1Nx06y08bPlXr8cz3b46e3Nw6f+PjgLmiF1s3tlfKm9bz13T03LPi1FiDirtHl
         wNqTRUGVQSUtS2rsaqEh7uo1jzxTdVApgz51VCdMhxH1wPp8qLcw//ucgaCrV8j36su2
         mgMrJ9+ZzVMb1D8yOYa6V08AqO0WvxWxEs95MkavuXQd3LDwBPFbOrgGZLqXyhqkXPDX
         BrVRRNMJGBhr1S+fx7hrYXNEJMwf9swlzbxdurTeHb3+S4GjcSNaZ1KFQCMYjdxPCBRs
         4H1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781192270; x=1781797070;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NYtgTeWcoc8nja2j1AnnQPehO+Fjn3oPCQzHh+zJqts=;
        b=Ofs09lRYTD3mDj9IYYgutN2TDnZ1CbLMmyFSz2Djsg+qg95oLrQG0M6XDZqhaqCTXt
         FghwX/+l3+V1VEznzcV9Ud9VDkAXZn1LbXqnIYJdeOodLwXiBUoPH+H0DlU/z8UqGpr/
         t0J9gQIzmaSOk3OwSgCfHlMWcDo+2XmiPLz4UohNceEHl8Ef14J0Tl41wWQcQZO7yjNg
         y3RQGOqPBc2hJnc266KKEhpQ0LYn7qucyirHaJYTOPW1la5Cjtf5kKlclGmbjz5vtLc0
         10cdYXY8+ZsxFZxAufBzbV6JarTOLMFPG2W907RscYm4gU4UuCZAE27ymVVdxl7F5k8P
         7+aQ==
X-Gm-Message-State: AOJu0Yw7FrX/indDu+rwpP92b3rZ4ZDhKN7oWGn+mXNb2RUUfMPTpibv
	+ebDTe3GNCNqoc13RCtQECTNC60rPshkVvmOBFnH4eVZSNBM/HOfQtQ05MgiemBK7ziqfRAIetg
	EPj18jntHZKbO6eKLzIrzuWmNUx2VVicZK3mUeSYfLo01uh4Uy6F2HgFG9SwHto5TgWQONQUTLA
	ArS7SyXDP7cl4QbloAx1lCIFQTwsHp+Zp4URC0LQ==
X-Gm-Gg: Acq92OG6WDlyB5aCla9dMVuFb5FNPgFMquVZNCRmpPit7impbjh7XbdaS8VJGzxUv0O
	cb66bQA97A4XKZCU+20wz+rlCfxcae/4acee0rLSI5Fy6FCCpTtBs087vb0s97WDCgOADSae5KP
	cMBFCQ7WN0TdbbGqzfmtdlH4cqLCIhP9FRpTcLtr0aDKseqt96I2CVcpiLqTF2Kpmnk5fXpa8CS
	LORPQtxamj4frWJlXe+gO1FCFBLR5LggANTSVJQXTV3kgmE
X-Received: by 2002:a05:6a00:8d8d:b0:842:6004:3fcf with SMTP id d2e1a72fcca58-84336a8b12cmr3829451b3a.29.1781192270139;
        Thu, 11 Jun 2026 08:37:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:8d8d:b0:842:6004:3fcf with SMTP id
 d2e1a72fcca58-84336a8b12cmr3829415b3a.29.1781192269622; Thu, 11 Jun 2026
 08:37:49 -0700 (PDT)
MIME-Version: 1.0
References: <b7c28bf9-df8b-420e-8da6-23d577f2615b@oss.qualcomm.com>
In-Reply-To: <b7c28bf9-df8b-420e-8da6-23d577f2615b@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 18:37:38 +0300
X-Gm-Features: AVVi8CdHVyKr2DNzDiDOeq7t_qAjcgrnPRjfgRPcvhZh8Gz3j5FA5F6GYW1HYXk
Message-ID: <CAO9ioeVjUprMnJ2FWnqQ=2o84YT=FNNWPWjYTdbivOvd+TM5Qg@mail.gmail.com>
Subject: Re: qcom: update CDSP firmware for shikra platform
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=FJ8rAeos c=1 sm=1 tr=0 ts=6a2ad64f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=p0WdMEafAAAA:8 a=EUspDBNiAAAA:8
 a=An5l4juaxN0w6su-QnYA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE1NiBTYWx0ZWRfX+7yw0KG1U1s2
 33/X3fY7dPfd6b5JraF8u+FjawgOWJgd/dsD3xsBkW6wuYHTFg9a/0y9JWWjStpwkIc4B3GDjhP
 JsNmEPKHeuGQAVrhvjznae3JLAeAK1g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE1NiBTYWx0ZWRfX5FT243+uO9hd
 9bCPuHjXhBq+NbTmbPC+Uxo23434hqinvExb73LvskUFO9R3Hb2POYMPC/cMrW+SnlEFjZOFU5E
 xHm4MHWDcWtO8Ja8eWfQYi9eDTvR6wq3tqIFxrEPhuCX0+GMpEDj/rYauruRfLDIXwAzdW6+thq
 2hWYhEqgd+aoIeXPr/eNkYd6q6Cm95gsVSzDjT1NTsnkERaP94X9UuLIKvbAz/MPUgrfGYmxtaI
 zcweJ8E3j2nO5om3FpCZXf/3tCx/NVg2+YHG1DzUSse2fNi78icD3JSLyFmeosksSr0hqLiwzSQ
 XvBUkRIpDf/IRWNH20Rtu7h5Qt3WUN0AH/vJqLnjOKKjxhrblwzvEI0enSHIhQs+lAuE3+i7o6f
 aBJCuN70V3k9IJttfj9OtE5CKT4l0roSRQ12RG7U4Onehwys+2KwBR739NMWTeeCd4NTbDNpW4y
 Y1ykZw2JmpZkXeCSD9w==
X-Proofpoint-GUID: rN8MrFP4ImPbf0J68Bm2JQAlxdPU0039
X-Proofpoint-ORIG-GUID: rN8MrFP4ImPbf0J68Bm2JQAlxdPU0039
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_03,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110156

On Thu, 11 Jun 2026 at 15:26, Venkata Kota
<venkata.kota@oss.qualcomm.com> wrote:
>
> The following changes since commit e7eb98afc667913acc533ab910c608bee7d08f25:
>
>    Merge branch 'robot/pr-0-1781081510' into 'main' (2026-06-10 10:48:39
> +0000)

Thanks, merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1096




-- 
With best wishes
Dmitry
