Return-Path: <SRS0=CvfH=ES=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 619B6CDB46F
	for <linux-firmware@archiver.kernel.org>; Mon, 22 Jun 2026 10:56:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2398E1F00A3A; Mon, 22 Jun 2026 10:56:24 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1782125784;
	b=i6EBAsd4eK9+n/2SgKM1tWzEc9oshBEITTLxp6zHfqYtstU9dxdTUnZClwWmcYMa3/E4
	 qzqQat1D6lj5l2oGouk6W1/QO4fY5PTC5Aa8hPEzvcLOg0Qg8s4XFCOeqmW/PTUwL9CNz
	 tQbODADhkO7qK+1hk2wjvLdhDduMU9J/OeQvzt0ee1X3r4Fur/Ts3Ub/+CY78tykzE545
	 LuoZetBSoBHv9p80Pr/0LuqR51+jMzfIBwmHpWTwoK42zB2LOrcI+/C2OuP2ipH7d81uZ
	 1YPnmJtKR8HqG4D8y/0aQ/FOTb8kAvxyYTyfPppYM5E1NUyEEQ2GSXhp/ZjZqk8xqcA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1782125784;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:List-Id:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Tc804gncbQCSty/AdI9/Oe94aywDuJTUay7nmcm86GI=;
	b=L2R/GvANMuNpLRgM7FQxDnmA167PECkWCB3VEroSi1FfqzFhbogpvMJCdLrOqGSLxvR4
	 z6NhbeDiVWARtvCk4Se4cXec4M/OGWV3xBOkxMDMkExhkaqfO3yGNM+EQVH5X2eYqoDoW
	 DQEK+Yldk2oU4lGv+E4nne/um19w4rfMJhPkwRq/10fBIgC+oRtwenqiRzIfbbIp9xxjy
	 7DW9NsNcavKWemhMA4CZTn83/fvVAMyepyUkZtdOBYcivY2tNRZvuvESb7y4b/JWh+Kjy
	 QmrN6V6y3nmXdVGoapqXoCzt8cNmCcQ+G7Ww0UXl4sjOXMKMr2gtPjblurwtl82QAzA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LEpU56Cp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CX6+K3BJ;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 86D061F000E9
	for <linux-firmware@kernel.org>; Mon, 22 Jun 2026 10:56:23 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LEpU56Cp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CX6+K3BJ
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 86D061F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MAn709380787
	for <linux-firmware@kernel.org>; Mon, 22 Jun 2026 10:56:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Tc804gncbQCSty/AdI9/Oe94
	aywDuJTUay7nmcm86GI=; b=LEpU56Cp7nNQf9XOzQEOZFgMI5cP0k+U2X4RPtE2
	2OEOFeGcbZgpbfvbYIzIrPw4+wqKcDKsMD3IBnIZdqgo0xfp9QfWu6COi0CdB6RS
	kWevQtZfDs7LfvSJCw07PW7AiB7aQB9esR8scjnR05bsLoYsF51Ic2J+vGTSVfLc
	qnMun+l9UUKLsRlZexaI0GbTqC0S06aDhZGOz7bVh7cxE0DWUMEU+sVwj8P0UlRr
	Xffw4AV0FdJgMVljH25+mGaNKxOy40rrJYMUESIY0RaKNHIsUsuGha3UboeN3YmF
	V5xz0V0okWOs49ns0tjQGiasFIRQ9XHiDoum94fOyESuzQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey3a0r338-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 22 Jun 2026 10:56:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-920aa2e130eso631435185a.3
        for <linux-firmware@kernel.org>; Mon, 22 Jun 2026 03:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782125782; x=1782730582; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Tc804gncbQCSty/AdI9/Oe94aywDuJTUay7nmcm86GI=;
        b=CX6+K3BJVujry8yz20eqNdJ7ZnYEAf1ARvQI/KVwrBnsbGSIe0wlxSOdvWrQDP3jZg
         HwLN+5Z7Wi6fO9K6B2SSUUqtjd1B3emhGio0uKiB8s0ecPZ+Nf0OOpcYIqr5+rA8tx0U
         u1zZCggNm25vls7nf3B0HTZuGEIwaXLxi1or29k/NRxlalCwxZw5kpa4HLaPYWN16bPL
         p0p2+ni+4CRmXiXJ5H8cFjDftHNC72XP1i0dlovfid5PalGadtREXQxjOZruMURTOJeb
         2sobLFsfFEJpGsMsNJ3wHy1+HjUSMZiKW5HB/yOc0+v1IPiOl159j/F0hCAYfzgRfl6o
         46Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782125782; x=1782730582;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tc804gncbQCSty/AdI9/Oe94aywDuJTUay7nmcm86GI=;
        b=pSmLe1j1HZw8nzVhTsfhHx/bZLryaH2LY2uRY4WX3bbnap5LXyDxpzIQ3wJeZFnHBB
         eeSM+jKQB6RyRWRVh5cteQmOu5cQuSlVsr8dQ/ThQrJw8luuPeiaMGSHEdOC9WraFUVL
         P5llrf8WENYpBysRiTBrluE9HLlRs0DTsNm72k+IcDA/dQdYlG1sUdp4m3yNl/qu1/5q
         4xYWHhdUp+Ty+UjQI8HBDKDGxCAk6X4Mn7S5h1Ysk3PogjjLMA3wk7IwCAIpu9c07Nx+
         cg5MR3EOVNGh1iUzZjRKYHtgeYT4LIpTRNRXk6DJOhnWHEknTlNjfpvphVeuutEPzo3o
         UIYw==
X-Gm-Message-State: AOJu0Ywnv4uyoKROSKxmG9TrtwpFJU/EwMa9usjVKdthAWuFrap778by
	aPvCxbeYOWTcCyLK4IC7ot4qzmfG++iMEdYtTu3IRSMrrZ4WA2FU405NKy9pPZC0MGhRMeGq35v
	gf3/i5EqBoBCQaZYo/9YyfYq4qhnN4AX3rHJTP47u9V8ROLyPXtJIwH7KfbH+jd5XxneghNM=
X-Gm-Gg: AfdE7ckGaFqEqDDiXO05k++9Ovfd62HCGoPznrVuiBxXmtCE/sm2lq6yFTSg/FBe3Fl
	F430cox+Kqh4XabKG83mtaz3TOBaoZkbPI7OcBJQWKu0267Ka9dAhr9F+BjUKvr76goU49k4o0r
	sOcHbDZJBpDi0lmcugle3ePzNdGS0qrV4DkPdI2V/52C6hi0Ny2zVger0SPsG7RH0cBRgBjawpJ
	X37ONFInBf9bauvan1/cNCn9ST6EkM6L+/A7ad2elXBIn9bQF1mXQRDCcoFsfjkEevFgUmyKS9N
	Vwxx88JFrBNKGG970yrRz6ypj57Sy+kPENTX2gdC8oEgD/4icOMBxG63rmEgmfdNWLOlDayEQ7H
	yCnaqt9E/2dIiNMIXEd28ayDNSvjyuVvKiDQEf+MGwvQFERjueVDViOoxCjpZ9klRYi+YUFV7Kf
	79CCRBYpAV40VCqUYFAiAHXnho
X-Received: by 2002:a05:620a:1a12:b0:915:9aa5:b5c6 with SMTP id af79cd13be357-9209149026emr2233121285a.36.1782125781614;
        Mon, 22 Jun 2026 03:56:21 -0700 (PDT)
X-Received: by 2002:a05:620a:1a12:b0:915:9aa5:b5c6 with SMTP id af79cd13be357-9209149026emr2233117385a.36.1782125781052;
        Mon, 22 Jun 2026 03:56:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3999b156f23sm16729251fa.27.2026.06.22.03.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 03:56:19 -0700 (PDT)
Date: Mon, 22 Jun 2026 13:56:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Subject: Re: qcom: add LPAICP firmware for shikra platform
Message-ID: <czrjz3taxceyxohxse2dzalvgg6uubtk7l7juj3mt3cgbpqvtf@vzlgbd4pf6mc>
References: <5e55a664-5e84-404e-bb8d-e46ab946a324@oss.qualcomm.com>
 <bwzhybkl4rtrljdkkzlx3rn65cpobpemjxsqfummqhjdqb2trf@q57qshjsqimk>
 <59937e80-7c48-4c38-8043-2bd328906b36@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <59937e80-7c48-4c38-8043-2bd328906b36@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDEwNyBTYWx0ZWRfX2Ir+P6UFceiK
 X8NWoHk1GnyqYdAJB+HxKOYU/Btp7EcQNrOIbilfxCLEXvcVYp3+7SJrvbYDW/coIpsSDUdkmfv
 26EmUuDlXfT+Hu/5gMc03/2+U5Vg0Aw=
X-Proofpoint-GUID: RFCVcOL4KqcYEMgqLQHrx8yoh9gfRI8i
X-Authority-Analysis: v=2.4 cv=UJ7t2ify c=1 sm=1 tr=0 ts=6a3914d6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=qC_FGOx9AAAA:8
 a=p0WdMEafAAAA:8 a=dfTPP5Tn55-3K1WbA3MA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDEwNyBTYWx0ZWRfXzU1O8SXGnFvi
 0BWcM8eR+yqoKa72NKAEVS2reYXVpsejrHlm0guqDuEmHIbBSL/Eios7RYcuKOTgsls1u190NxJ
 xaMD4Da6jthV84JK/RGoBL9CzCdgwrgKj4NOj9CTrI442VmRFKfjo3+XXJrXIa/IbMX/HPHxMvg
 xKmSyQp8cCmciK9FeEoVv8aY3+H7aCv5kuoUlqWiMcL+MVTN0WurEsFZB8jNrEUda5J8rH6RL6q
 eT/+Ma5iI+Ayhqxi5M/Ws+WYvygLMaMKFuchdt6CTI1tQoIvkcASk1j9WfbY5zNqOdxst0ycgvy
 Msbeh1Ezlyxk5d15UMpYDugZicCsL6uuy/FfCMQfIMm5HwiCEyrRU4eciQoShx45seT/aGFxDww
 UAKNR7uIN6s78MmcnJYNOt7WR0Y7zFX8vOMOn3j7xj+AZ5J6Apb9L+WYveL7b3xmdDkYTjDVgNj
 6o9ApwlVS6PwWnoelZA==
X-Proofpoint-ORIG-GUID: RFCVcOL4KqcYEMgqLQHrx8yoh9gfRI8i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606220107

On Mon, Jun 22, 2026 at 03:14:19PM +0530, Venkata Kota wrote:
> 
> 
> On 6/22/2026 2:03 PM, Dmitry Baryshkov wrote:
> > On Mon, Jun 22, 2026 at 07:17:42AM +0530, Venkata Kota wrote:
> > > The following changes since commit e7eb98afc667913acc533ab910c608bee7d08f25:
> > > 
> > >    Merge branch 'robot/pr-0-1781081510' into 'main' (2026-06-10 10:48:39
> > > +0000)
> > 
> > This is the same and old commit.
> > 
> > > The source branch is 36 commits behind the target branch
> > 
> > And GL refuses to rebase it because of the conflicts.
> > 
> > > 
> > > are available in the Git repository at:
> > > 
> > >    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> > > riscvfw-qli-shikra
> > > 
> > > for you to fetch changes up to bcb6950bbf1df55f4588bc55abbd17051c4a1dc5:
> > > 
> > >    qcom: add LPAICP firmware for shikra platform (2026-06-22 07:10:40 +0530)
> > 
> There is no forking done here. The process is just the same for all the
> other changes that we have pushed.

I didn't write anything about forking. I asked to _rebase_ on the repo's
tip.

> I attempted to push on gitlab directly where i ran into the following error:
> remote: GitLab: You are not allowed to push code to protected branches on
> this project. This is the exact message here
> To https://gitlab.com/vkasinat/linux-firmware.git
> ! [remote rejected]   main -> main (pre-receive hook declined)

Which basically asks you, why you are pushing to the main branch?

> error: failed to push some refs to
> 'https://gitlab.com/vkasinat/linux-firmware.git'

-- 
With best wishes
Dmitry
