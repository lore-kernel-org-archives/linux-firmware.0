Return-Path: <SRS0=6AJk=G3=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB1BC624A4
	for <linux-firmware@archiver.kernel.org>; Thu,  3 Sep 2026 11:54:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 67F6D1F00A3D; Thu,  3 Sep 2026 11:54:09 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1788436449;
	b=qMSkVxK3BPw0ZgmOw2IApzDuCZXneNr+2jhdA+oppst99wZw08m/ASLOsUhOhJ3tiYL1
	 EAiMDxDBAKOYhcH6rDR8jQDL69DsQUoLuFzuArgWcQj6vXJSrozi+2aezRCPBaXuUO79U
	 d5xrXL2yu7D737ZxZIqKlf9IrRfTksk1zBw2S6ekIxftNssZBlsljtZHAmfcDYFVbuIIC
	 aLHaYOEgxz+s4wES1kT81ufG2Ff/n4FyjOb3hUBYCTObMfpgNYNqaDCbl7haNpiSs13k7
	 SV5w/0t0cZWbIe9v6Udvq/vfvvjDnbPZfcVxKn8bMEYkdmBdJQ46iBxdKw4rH7sHYrw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788436449;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7nY7uof0WrzFaA4oqTig9aNOjm2g3V8gx6wLIppv6ug=;
	b=c++mFIvirtKMZ4T/2/Vr4+QfXZkG0o3ZoPox/nYFi6pERbhRdIv2+qnKUPYp2Ok7oVNG
	 NzL+3IrtZs3JqKK/tknAoqnOVIQ3h6P8SQl4l3b5Vy0wpPnIq8v11yVNhNjS+nhKuBLx7
	 vVO77TALHhhzoUjDn0j/lQhVQsGX6bR6Be+n8Eb8Sku+uYbu42xH5EL4/Tp5x15oFbsuB
	 VkVncOl/os/nT73VnVZzzWBanMutvc+wwDINrWmsXIVYWoI/cod4CQ2Hx8pVXf7ZYLVMH
	 wo/bTS0/mtBhVoKIvsSt5m+Tly/9fhq4Lu4G9x0m/PeaqqlH2SAIcAmVQqtTtNUSvLQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZyEBD4eI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UHprYE2c;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C1B771F000E9
	for <linux-firmware@kernel.org>; Thu,  3 Sep 2026 11:54:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZyEBD4eI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UHprYE2c
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org C1B771F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AH5PE935080
	for <linux-firmware@kernel.org>; Thu, 3 Sep 2026 11:54:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7nY7uof0WrzFaA4oqTig9aNOjm2g3V8gx6wLIppv6ug=; b=ZyEBD4eIvyHKnHOH
	DIrTINqz8q/N0QuIBnL4m8RcGJRM5A01aY7qHeuLrYfKgT3xQ5EAykRoKdLjC1Ax
	3350UcmdatAb1mnhKmm86dQISQglAdbcoWobd141nKE///kch9HG0CRkvhLqIRDc
	WQN3bDxbwtZrpR1fnTKRTf19iTNQXv3sT3+4+jJwdko8lPbQsSrn6z3RIwT7ahP7
	dtAjIz9jeFbYU3fUDU6ygORgkX4sKxOGYO3Uiti9oHCK03Cjse+IKbxaghEknfyx
	xHyeh1zmy8YvNE/xULJtAyTJpeKt3bKwVyxykAOpBdenLdm6s9ci7u7DJD0K3zIU
	QV4MqQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gerdnc4nj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 03 Sep 2026 11:54:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92ef13b61bcso509871585a.1
        for <linux-firmware@kernel.org>; Thu, 03 Sep 2026 04:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788436447; x=1789041247; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7nY7uof0WrzFaA4oqTig9aNOjm2g3V8gx6wLIppv6ug=;
        b=UHprYE2cW+QooIGrWmbYD9FGWx/G2XHtT1WLQ69GEvPkLDnFizRIxqc3BHAwcIWwX9
         9lfSkIRseVsdKa4iAIr/+nju3CyW2pK025seAPVp8OoPgdK8JPapogr4Ru7zbIfVuFNk
         JSYvD6kxg33/6dnzDdiHzn/GX7On0N2Z9s+YZikZcY2cyImCDs4YhJ+O8YC+joVq/+QQ
         +zEXtncuvRLw2/LOAjps8wahqauPZ48NPrsae7GP8EnY8yG04k7aZrEgA+O2kItd4ReD
         kUGezXB+OL1agWeWkdaMDOW9kLo2lSJOSdYetg2GFHFObMN+C6Gp9WQGma4eg8epJWOU
         I9Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788436447; x=1789041247;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7nY7uof0WrzFaA4oqTig9aNOjm2g3V8gx6wLIppv6ug=;
        b=dPfWwYiFqYl4yGPSBMqyExjuW+F3vChjemrRemFDsmlWlDb6zJ1O4DugcSzBl16Quf
         o3NHIzMYRQtLmH1en/NgVSJJgvfZ5u6bqgMVH+raev6hkCYtthhPrbg1kdSRJhJtpP7+
         YDhLISCD5oQT9Lw4QqceKTzZVFIR0wggD2NGn2xB7uy5Cj/7ZzFRO1of2M3v1yJOV4D3
         juPYohPeiFsXmNtAHA6v6lLUBXf8SJDqaneHYIlFtg/qvSTKRI19kjWL6v7fQAr3l/z7
         zSnbYg3pV7rqtcvZUp5WLjB+gmavD97yLW19VPtD2fIzHUs4NXyOUBdPKx8vReA+t4ZE
         VgJg==
X-Gm-Message-State: AFuF++nH5wv8GJvvNu/cwMzqQTaRq2V3FYus0K8tUZUTkKKkwK2oGgL4
	IA6cYDElJcyiqCjmO5hfDE662f8fL25qXHYDDJwkw9sKNGcl84SwjOmUAAt8ijCHgTKLq6Bpd7j
	9xLfQNZuD/jRG8ncpOg1S3CUaRKch4zCq1aZnDdYrrm/0kfo44FpdqESOGGxm4vo=
X-Gm-Gg: AYBFou0sqdeVicol2sDLL53XthSTBXYcXw6dvk8N8RGeATT+LpuYRPJPBPwKbCigFfy
	AiAu6nr+6thBOGjQHHrlt+xVysIL/pgcp5rZOLSC35zEMWi7K9tqRMuk++kAE0AvCE7VEQlOVKD
	ze9jLabP/Kleu/aS1D7ij68jsgK+2jTdHV6rwLvmzadkQ56NMGE/0cywNmbvyRc0+6yVmGPHB0u
	GitnHkQPnSekZes5hb03lUxrhvzVBJ0ZvOsotROLYbFHh1LmE+4S/ekIfGO06Zsod55v8qEytTH
	INI9X+ud6UXUrifcwJ3IB7LkHDffPkmffSP3C+9gdns3Ax7SckFK+5fzS2VtL4arX8q7fXazzNH
	pXoVz5/awPTHQicxdTXUSzUm/5eM94PwtzYpURrJmmOlHHv3/aWvmHQXJIY+i9YVeK79pj3+kGb
	ndHVsDERMD1Vfz
X-Received: by 2002:a05:620a:29d4:b0:939:6de8:43da with SMTP id af79cd13be357-9396de845e7mr576339785a.46.1788436446893;
        Thu, 03 Sep 2026 04:54:06 -0700 (PDT)
X-Received: by 2002:a05:620a:29d4:b0:939:6de8:43da with SMTP id af79cd13be357-9396de845e7mr576335585a.46.1788436446433;
        Thu, 03 Sep 2026 04:54:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b606b0ecadsm1290559e87.8.2026.09.03.04.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 04:54:05 -0700 (PDT)
Date: Thu, 3 Sep 2026 14:54:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, cheng.jiang@oss.qualcomm.com,
        wei.deng@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com
Subject: Re: QCA: Add QCC2066 Bluetooth firmware hpnv21g.30c request-pull
Message-ID: <tmq56nwawwu6653fl5c53k6ktgmrcj5rcsfu5uwubme34mdcpc@u33lqduue3f4>
References: <eac4e82b-47a4-48df-a8c0-445975a14f5f@oss.qualcomm.com>
 <4z7ylgqvfizcdzyakkaymp4l6hr5qx2g3tddaqvzfqujecbxye@qu37vrgudb3e>
 <0b6bcc31-1428-4652-9855-4a52ae1c77ca@oss.qualcomm.com>
 <os2dizgipn7xbnbgycs3h6fyrcbsk4ybutndexwl5jiu5cd4ax@2xvwaxte5ys6>
 <4054cd15-d1a3-4157-ac11-f4d248890865@oss.qualcomm.com>
 <pckqcqzhpax562yzhinf2fbjqgy2qcqaaoyhw6xgitrrksv5ag@pqv2s3jdvpue>
 <819b432c-6f63-4ce4-9c80-61453fa8456d@oss.qualcomm.com>
 <3lo6dh6q726emqikhm4ynikwnrefva3ucsrhrmuyjcn4wnhlhn@7cdvnwbuyvji>
 <115bff7f-86d1-4798-8aac-674864713821@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <115bff7f-86d1-4798-8aac-674864713821@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=YcmNIQRf c=1 sm=1 tr=0 ts=6a995fdf cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=ldACv45T97_ADuxkMTsA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEwMyBTYWx0ZWRfXynErk/KPn+I5
 8GYaL84Nrlkxexegsklobqcx/ETS3XGm1sGNZgzXOQBcnSJVDptssrI6sQabJVcQ43S4GgJolLk
 Q7tQeJpe1Ck6eslRcJK7nraW1DnU5iM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEwMyBTYWx0ZWRfX6TRflO5Y6+QU
 Y74QQD4ix/YrdTB45H295e05kFjWM1jV/9LaLRs4CV6ZX/gg+XJxsdJEsbIKBh11nrfAvxlNZtl
 5TjVryBu0I+DTQBYupZXrTaxCH17BAwwNhZQ+nPvmzA0F1W79Kswo+w8ACHXa0g2L86CooqhJZd
 6E51lJ4Eol8CdPbrXWwMstBa8fzleHZCXGOfK/LDEa+XgA1TjqaC1MacBn5BwfFmE6HoguTyfIw
 Loh1/G9kri3xqWfBcW2h4Y2TY4JFXoXRIqOLJAZdd6skDAiNj4LJILIiQNa1bb5lIPAxiHswyRn
 eh21PUOZNoYQFGPGFpqL2wJzEXRQ0PwEIu24Ws2YtdjnzdRq8GWvGm5sOLFeHuNISNV3Fh1LMxH
 fGkiUH0tqk9pul6gX1vOCLXnK+Lsp/UE6+dd0exiHhBorF3CnXp7/iMWWxkT71osR7L+3S5DhPZ
 TnNJi7jYsRsze/rx8sg==
X-Proofpoint-GUID: 1soVsEGYKs2nv4chWo5Yv5KSgVr8TsT8
X-Proofpoint-ORIG-GUID: 1soVsEGYKs2nv4chWo5Yv5KSgVr8TsT8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030103

On Thu, Sep 03, 2026 at 10:51:19AM +0800, Shuai Zhang wrote:
> Hi Dmitry
> 
> On 9/2/2026 4:36 PM, Dmitry Baryshkov wrote:
> > On Wed, Sep 02, 2026 at 10:40:54AM +0800, Shuai Zhang wrote:
> > > On 9/2/2026 10:26 AM, Dmitry Baryshkov wrote:
> > > > On Wed, Sep 02, 2026 at 10:04:09AM +0800, Shuai Zhang wrote:
> > > > > Hi Dmitry
> > > > > 
> > > > > On 9/1/2026 7:05 PM, Dmitry Baryshkov wrote:
> > > > > > On Tue, Sep 01, 2026 at 11:07:20AM +0800, Shuai Zhang wrote:
> > > > > > > Hi Dmitry
> > > > > > > 
> > > > > > > On 8/31/2026 8:29 PM, Dmitry Baryshkov wrote:
> > > > > > > > Please test your PRs before submitting:
> > > > > > > > 
> > > > > > > > E: qca/hpnv21g.30c not listed in WHENCE
> > > > > > > Thanks for the reminder. I'veupdatedthePRaccordingly.
> > > > > > > 
> > > > > > > 
> > > > > > > are available in the Git repository at:
> > > > > > > 
> > > > > > >      https://github.com/shuaz-shuai/qca_btfw.git qcc2066_fw_v2
> > > > > > > 
> > > > > > > for you to fetch changes up to 2245d3d1eb0593145573a41fa941e4e056031cab:
> > > > > > > 
> > > > > > >      QCA: Add QCC2066 Bluetooth firmware hpnv21g.30c (2026-09-01 10:51:03
> > > > > > > +0800)
> > > > > > So, previously it was a link, you are replacing it with the file. Why?
> > > > > I checked the WHENCE entry and thought the symlink was incorrect, so I
> > > > > replaced the Link entry with a File entry.
> > > > > 
> > > > > hpnv21g.30c is a renamed version of hpnv21g.b111, which was what I
> > > > > originally submitted.
> > > > > 
> > > > > Please let me know if the preferred approach is to keep the symlink and only
> > > > > add the hpnv21g.30c file.
> > > > If the file is already present, why are you submitting a new copy of it?
> > > 
> > > This file does not actually exist. It is only referenced in WHENCE. The
> > > relevant commit is shown below:
> > > 
> > > https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=3dcf6778d29c72f91aa0ac0ef8843a4aa6e11c1b
> > And this commit means that during firmware installation the script will
> > create a symbolic link pointing from one file to another. This is a
> > proper way to handle duplicate files instead of creating a complete
> > duplicate:
> > 
> > $ md5sum qca/hpnv21g.b111 qca/hpnv21g.30c
> > 3f5c3585d7a0bf1f076ac95b7f69b5a3  qca/hpnv21g.b111
> > 3f5c3585d7a0bf1f076ac95b7f69b5a3  qca/hpnv21g.30c
> 
> Could you please clarify the rationale behind introducing the symlink?
> 
> I couldn't find any related discussion or explanation in the project
> history.

Why would we introduce exactly the same file?

> In addition, if I need to make changes to the 30c file in the future and
> those changes
> 
>  are not applicable to b111, what would be the recommended way to handle
> that situation?

If those are not applicable to b111, then you will create a new file,
drop the Link: and explain in the commit message why it's not applicable
to b111.

-- 
With best wishes
Dmitry
