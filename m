Return-Path: <SRS0=f/Z1=ET=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FAD1CDB46F
	for <linux-firmware@archiver.kernel.org>; Tue, 23 Jun 2026 09:39:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EEC5D1F00A3A; Tue, 23 Jun 2026 09:39:16 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1782207556;
	b=txNDP4kKcs7zTuCLUDhB1NdQYRphMZFiIkBQBOWmYvZU0CJdkshVTQE1J+hRDoRSUPvS
	 PceenXWxyIMVq2s0Hb/FSOjlevLr4jRo68I0NBgo3trtS+MAU6M4exsYodC0fW2MSD/98
	 6rmP56YlVMX5HcQqpauWWy+VMFENUgFgrR4TaFxCuAE59d+oFKS4PfYUcSPBSgjw53fiN
	 Cjd2H1OB0l3N+QAKD05hPHGh53/aO2bq6a0n/zXvQf/7142r0vzaychlRhOxuAvNczT0G
	 z3bYkOBcsuXACTcJb/JTUKpfjapsYeg4AO6RY1tZ16t9vkYtbw0kdoipJyuhQeqIXeQ==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1782207556;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 List-Id:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MulPS6TSrZ3rN6zNAykaB5qdfvHaY/8SEF4sO518r18=;
	b=2HlSqE2UcE5KN3Wbn4P2UI3HGfZ12ooc6KpBQypRPRWnrW7eC4veOA4FNmVyL1g/UnAV
	 Uc1a8c28e5jFwrvQVQdg8CooNCqzVzdlG1g7F/X0NfsNrP64GljiaKuCSg3be8MJhq6KO
	 8OWoS6FxM6f8keqcBMFm1ikvxqgeE0D/fSqAmRVdaEBMkkDTaXvSgyWg/EezXahMr19np
	 9xlTucdu1kSlzY0pL57kKTTm6xr3sPIwmyABD5qyknVITxNKx5RcaMAMCNajEGnjTna/B
	 l6udGTotEU78E5uCxIU/Wcj7PhDvySG/QDzLUZ7WAUS08ySd412DE2fCwV1kitNhSFg==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iSa3W8S1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VSw4OyDV;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4ED2E1F000E9
	for <linux-firmware@kernel.org>; Tue, 23 Jun 2026 09:39:16 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iSa3W8S1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VSw4OyDV
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 4ED2E1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N6cj5w3338576
	for <linux-firmware@kernel.org>; Tue, 23 Jun 2026 09:39:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MulPS6TSrZ3rN6zNAykaB5qdfvHaY/8SEF4sO518r18=; b=iSa3W8S1Z9GjEL2z
	87SfFcBWghsbYAt7t5IChXDdIuNBQbuWUDXtQyydLeJxRhCPyfXZJsx0aOchkttc
	1J5aEmaJCe8vtG9ecaiaoDAdesbd0tz4DmKRutnqMfQyIoBy1l7aOQ1APYY18FfS
	i5LK7weT6o5rFqlobLC9eyVltpthwUGdp35FwhTxe35mEQutclbMwDwuI4DT0ACJ
	yPAnbadggm/ztzokHB86Hp5VH4VlNqPO5iaBaM/2OZjdimg2Mu+Dm+YWdFxBORk/
	fp6DfMYVRFQjcNyOqkuW0+JZbRglfSQEGPEIp5yos+V6tHNqPIBrrWURc+0Sc1Dn
	1zzUDg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eygkjhm92-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 23 Jun 2026 09:39:14 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37c89e480easo5887044a91.3
        for <linux-firmware@kernel.org>; Tue, 23 Jun 2026 02:39:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782207553; cv=none;
        d=google.com; s=arc-20240605;
        b=Ka4+kDv4Y9WeyYetHQxrUyI2jR94JWVEdMq1vK/UASik0MdpVstGObQ3K5ZjAbbaha
         cEFUdIcn8BeXwTdJIBN+UJ+jd4J14Dh6HjuYvy2UgvN1Y0giY9veGJGubQNyFO6ba+PB
         /nByMqpYiRWL5km4qLVyhdpdezBKzFJjnHwI1+W22bQHLHLE5y9XzR5cywvl8kQOeaRV
         uNQGK9GMopIzWB2KpYGYzmJ+DZKUsjKHZ+wcMT0TTrZBDeutz85pYxgvuDJvkR192sWG
         FJRkycqZE4qwdPiSCaYWNiTGdgZJ+2y41t2iDlsiYyNBxoNewb8r1HtJENGtDZyrC4uw
         yjxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MulPS6TSrZ3rN6zNAykaB5qdfvHaY/8SEF4sO518r18=;
        fh=L7KYuehmGhHQAughb7akbT0Esw/4TIoFepDNcAZ76H8=;
        b=aIfhbH7m1hsWg49xQnaO2HcAOUIhKoInb3KiIBxUNBXxYxHN4z4wGdYJdICDrOC9AN
         pX5+4RDQ+PcgpYABli71Uo0L+3a6pLl9PyNCo1yicUoiXF7hSaxWLwNMNBnhAAgJxwD+
         HnvYO2QKyUF/vAij9hbEVKbafuTdlb+Kkl8Z2/mLGQx44jbUJVjFes8S7+F4H1Icyov5
         W2lyO36rMo/3+LcLhbhtHvZzp4TQTsh8EfArXruPXElfvoR/gH19lKK+EnzDMRbiAcTk
         HLrH0/2LL9JxPQy+WU15JRthkpyRJx8p1UDVNdqet7+fpWNochAPWhCw/wLnA9KNruWz
         VHjg==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782207553; x=1782812353; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MulPS6TSrZ3rN6zNAykaB5qdfvHaY/8SEF4sO518r18=;
        b=VSw4OyDV/a1d9eq+JiZXdXOfuU3eL2cWHaR7Z8pSDtAhTWzZcOg+4TiTW+kkaGnrTN
         pnOq+De7d5LzbPOS5ic0m2a6y33bmRsqGcS4TTUDO3+Ztn3x61AuOJOErPrM1jVq2PFy
         axY94um2oBpRVnjorMXkJM3tuq49LorWmcqZ+Koa1Ah/LzlcaSWhU3i86g19iJVwjmvi
         /pt61qCwTI4PxpzUnVm5fyg4cwzXjOrEuwRpfHAv3Yud+HzJauWmTKMvz8oIrEpJDbgs
         TZChBojIP0l1OoEX5y+xQJBOCuuHvWIWnxuuIV4D5aRVNFVGekQ5sPto3JssrxkW+X6v
         f4bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782207553; x=1782812353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MulPS6TSrZ3rN6zNAykaB5qdfvHaY/8SEF4sO518r18=;
        b=YZ4kUKa7b0UTL9UeZ1bvvyld1UBtGOW+1wVeygzedbqSF16pd366tW+UnSd7iPpIOV
         wLBlSiswYR/JNfpBRo8b9eVCFdoAP58whS2bikXxjH17SvD4HJZItfxf19tqau4a4brR
         QhwHJZ4dqm+P9mowtAYZYIlpokHkXWx4V108Q+Kv5Hb7mGSys1aSUe2t/26STAz6goot
         VN5/OwbB9LWl/u1wRv5TD5EzcZU6ggDQIcc4QOigbAz29a/jEtxJ90w6ubDZd6pEJeEO
         amrDV1gptIA00q2uZtCbsg5y5KVhQjAoFHw9HLQjoTwVKfAVx6/l8eAQ0YXvfVb4PKCO
         Lm2A==
X-Forwarded-Encrypted: i=1; AHgh+RpTZJs+t8JYJdczLc4KndbORtJKODn0FVjOTRLDBUKWm2MahLT9R6j6Xg/2sOWwtXenNX+iXN6TO4yCZGzbCA==@kernel.org
X-Gm-Message-State: AOJu0YwcumrzSkG3rdd7cbsuTIwdYDzKu7CCeuxF+MkqAIajg5G+pwaQ
	fuyGflhZ67uzSDk0PnNtAE+WqtSJEBGU+RK+v4g+wUiSasa3XJphjwqhwDhxqfh7Vbmq8gDdXzM
	C8cJnyV5k4N4tcDu1ISRUHSTR6JkTABOXpJ/48UBsKIEW/y+OXZvlu15j6PQoQb2kkrOqsCRhxY
	SR451sw9OS9Y/r93ScZZzrLxZAstHUGfZJcYeiOA==
X-Gm-Gg: AfdE7cl/yKI4DcXrS6LUAeUGsDiDHDgJk1skhwePXD1IW8bmOyug/PiLLN/TS87/Rni
	d2wU4vTRPzV9rZOvJphzd/9liHbwdl5pokowt8/McE7YpJZJPJpY9La5NdSORoc7iRNha8SJ123
	FpzMOkmNApEMvSjCjDLCIDwcrK81Em2fCly5zaHfxkqzm9u5hL35LSL5rBILZxPx+wXjOo
X-Received: by 2002:a17:90b:4d01:b0:37c:607b:2cd9 with SMTP id 98e67ed59e1d1-37dd15cb3d2mr2075893a91.0.1782207553528;
        Tue, 23 Jun 2026 02:39:13 -0700 (PDT)
X-Received: by 2002:a17:90b:4d01:b0:37c:607b:2cd9 with SMTP id
 98e67ed59e1d1-37dd15cb3d2mr2075876a91.0.1782207552969; Tue, 23 Jun 2026
 02:39:12 -0700 (PDT)
MIME-Version: 1.0
References: <45890930-775a-46cb-85e5-ffaadafd829a@oss.qualcomm.com>
 <CA+5PVA46e=GXNjPBUc53cQZBmDGVz7_GGrLY9+Om16ObG3uKqQ@mail.gmail.com> <7653e9d1-4002-473f-bcae-2fd41fecea51@oss.qualcomm.com>
In-Reply-To: <7653e9d1-4002-473f-bcae-2fd41fecea51@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 12:39:04 +0300
X-Gm-Features: AVVi8Ceyfv4pV43XBr6Oq6lSpqWhoSYzxu8eTn77GqOQ0GxU0TjeMsjROw-HOXI
Message-ID: <CAO9ioeX-94FxkeaL=D5yv1RuXT_5TUaF2nv7AoVRqe8kG0-FBw@mail.gmail.com>
Subject: Re: qcom: vpu: add Gen2 firmware binary for Purwa
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Josh Boyer <jwboyer@kernel.org>, linux-firmware@kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA3OCBTYWx0ZWRfX+83zHwkMzpR5
 w62csiPwily8TJ2q+Fm5i4aOyz0+mMxf36VjEjfX4lgtJKBIsLwMSLA1pQMLxPKThkeK+xwQe5l
 T0brrlK2Mh/UMqPqw/09jCIOFVdJnj8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA3OCBTYWx0ZWRfXzZGrrk33gyY0
 vxC3moRIMBP0DhmSbkR/PA/kAzT2uXnAdi60rBfMyB6lR2LtLwH+3dhDQxw+NICuGKMwwgJNQCr
 zFiG7NWd0cs49XsMfFSX21sLrOP/2dlku+nA7u26GOgkIiSe+/ICFfftA8zEVeUMZNdU6umQCm3
 IBkddKsVKmdLs4E1giPKk4sWVFja+hh9PbAuO5Lig/wSk4rppd3JzJ3b7Go3+2/xzj3175mNiSm
 zWH1rKNZlahSu0qYWV5a2jsdD6Z61Wnw/iMB8JRu98T62YikRDNipFS+8TlFiIQbVLaYek1yj8c
 /FNRrG4rO5C3fbYqxb+IxJQEUQ+Sh+dTElKM2Hj59GxfZKsQBbi3S1Y71Ruee6IO3o7T/YlWWZI
 suVt++GVkrVSSmdFekqGEV/egR5Hcw==
X-Proofpoint-GUID: _wsHI67gh5X9TABK8o-6TsNZE7lu556f
X-Authority-Analysis: v=2.4 cv=SoKgLvO0 c=1 sm=1 tr=0 ts=6a3a5442 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8
 a=Y_FK-CrVLfYiwx3EGZ0A:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: _wsHI67gh5X9TABK8o-6TsNZE7lu556f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230078

On Tue, 23 Jun 2026 at 11:29, Wangao Wang <wangao.wang@oss.qualcomm.com> wr=
ote:
>
>
>
> On 2026/6/23 4:40, Josh Boyer wrote:
> > On Wed, May 20, 2026 at 4:45=E2=80=AFAM Wangao Wang
> > <wangao.wang@oss.qualcomm.com> wrote:
> >> Wangao Wang (1):
> >>         qcom: vpu: add Gen2 firmware binary for Purwa
> >
> > This one doesn't seem like it's been merged and now it has a conflict
> > with main.  Probably needs a rebase.
>
> Thanks for the heads-up. I've rebased the commit on top of current main,
> the conflict should be resolved now.

Please send a pull request, so that the robot can pick it up.

>
> Repo: https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> Branch: video-fw-Purwa-Gen2
> Commit: b8569739ccb57e60ef934b99e249cd32f37e7127

--=20
With best wishes
Dmitry
