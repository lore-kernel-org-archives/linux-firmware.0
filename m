Return-Path: <SRS0=EIsd=ZG=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1998AC7115B
	for <linux-firmware@archiver.kernel.org>; Mon, 23 Jun 2025 22:41:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DA2A9C4CEEF; Mon, 23 Jun 2025 22:41:59 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CFD52C4CEEA
	for <linux-firmware@kernel.org>; Mon, 23 Jun 2025 22:41:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CFD52C4CEEA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NG1MGj021627
	for <linux-firmware@kernel.org>; Mon, 23 Jun 2025 22:41:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CEJn1UDk/Re9IBQEU3xmaufhMrBGwd8yzCvZa8B+/N8=; b=iPGViIF7uQTrBDqR
	ffGo96afKCtsGzvblC8VzsRafB8+nLOtmh+WOBtXetuktCB4TcN1U1AI8/KXpZUW
	BoHcm2xmyG2ZW51sx0J1UkGPhvW7Aw2DiWZVDm+jqjhpLc2ksH9I3+N7Pb+Pmp8B
	qRP2GkzLvmvep320cAnw3rXUnhkmLf1C57+7qTPeZ7rZ0NwuuKftYxpVAJC7lFOd
	BCRjL8Zw55hiGZFq++6S+SddjANTy0TGY2XkKzgt2AYfu2uJ3NKksn2pDxUodRPE
	rhGicABSLc3FcsFuTxl8ngBD4NfA7gSgeDRhQ/n6yLtnXPp4E7PDgrKX9z6KIP7r
	eLX5nQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f2rptagk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 23 Jun 2025 22:41:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d3d3f6471cso744172885a.3
        for <linux-firmware@kernel.org>; Mon, 23 Jun 2025 15:41:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750718517; x=1751323317;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CEJn1UDk/Re9IBQEU3xmaufhMrBGwd8yzCvZa8B+/N8=;
        b=KpEp8kVwJ+zSkOQl1eB6H9XS5SEUOt4NR6MBoChR4zsOc6zKMjMvpFX1bb7wD+vo7X
         BjDQ3BgcxHzEvhzWDHjQ/YKBjf2ZjW9xfRzPAUrrJlyISgCBioVhJNTzCGB9vPKVjCr7
         nVDcHKcas4ltzILMRep+W+NikJChZgpGhlkJ2JbA7na0mXKvnGNrI7W3JTcd3CDPTNn6
         UNZ9bDwRiCObx67Pql8B/RznSEicBVl/pMnzZS6BaLcrkzWxkJnrN9YKybij76UfrHcj
         hpEnAAyyjR780DL2Ujh0a9PvGIcXzYGP7/szvcR2ZN8F8wAeA3kfQvZNTpczbz8kj7SD
         tQZw==
X-Forwarded-Encrypted: i=1; AJvYcCXfkkpX3ScDp4BBAeYtpyR3HEM/S8Z0cXX8JXJhyK9P3GgjwmRktEVDkidJ78JU7LGTNWqV60uWHvDeDym9Tg==@kernel.org
X-Gm-Message-State: AOJu0YyaSPavWeuNk5ii/ck8OmqfFiZk5dWg36Za0SCRow4r67OVE0H5
	r78tndL5zsZdQsr2pw95HVAnOtmvPlW9a7WAegHkhTkuLOp+4/PXzrYW+iJyQiArxxaYUWe59hN
	JMSvqXoW2AYpQyCGxlqMO6iEPanRc9mIPW5AauEkRufNtvNYGM5umwBuItU8ftP8=
X-Gm-Gg: ASbGncuJGnt6hvfhcHrD7Fk+Aw1+CeV4qATu3eu0e1lpad+GTEhz49avchG3jD3czWo
	uwetnw7T9MR7QHGHKYP0KZlALzzRThiYSqPiqQ1Mrm1qmRCdIdCqUHQpiyPFA/dVbgLYlq7UoMM
	zG5JyNCe4txFwYsD3NXmnAisiRJJBN21BzUBS6Qynu4MwNtlPU1c7LG0zlcDaf81MwiavpAqsj6
	6HSLNtG0GTlUcYv/nwxeznDpbaQrwdhvKAgNPq2yInpBTIw5o7Vu98vR6eWmkxzV3SYl7IskE/R
	fYJuQ7H0ENSmQ3bvqzVeyPyE5tQdUXnMlsURJ+zp2xtzap9EMjfaHLOzg0XuPDwx75oDWn0tTiq
	nzeZ0ViXU3oXqnzsNiXtqoqMV9k4xKuZZToQ=
X-Received: by 2002:a05:620a:1997:b0:7c7:bb3f:fd40 with SMTP id af79cd13be357-7d3f98c335emr2129915685a.5.1750718516675;
        Mon, 23 Jun 2025 15:41:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOBx+tFQ88JqQMH0q53v0eiwqLerg4PvYaO8DCs9ECMV65h4vrC9d9JZ3ErC+mCmmuGukcTA==
X-Received: by 2002:a05:620a:1997:b0:7c7:bb3f:fd40 with SMTP id af79cd13be357-7d3f98c335emr2129912485a.5.1750718516220;
        Mon, 23 Jun 2025 15:41:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41cc231sm1552475e87.232.2025.06.23.15.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 15:41:54 -0700 (PDT)
Date: Tue, 24 Jun 2025 01:41:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Slark Xiao <slark.xiao@gmail.com>, linux-firmware@kernel.org
Subject: Re: [PATCH] qcom: Add sdx61 Foxconn vendor firmware image file
Message-ID: <yzxrb2v2eot2mzftr6zjizp62nijs2bu2qjc3p7lpmfp6hmauz@4eizsg5azl43>
References: <20250623115444.12870-1-slark.xiao@gmail.com>
 <xlredaznmv2li7vs4vi5dze65d5fhbff4tvvsjcraltmrs7jx7@vdj4n3u2zu5f>
 <CA+5PVA5CuoMv3rTxb=StPWxf2T8KcQjvgJG_1duHG7f8gWuf6Q@mail.gmail.com>
 <6733b4ea-c682-4a0c-b166-d6e9a3bb4e6a@oss.qualcomm.com>
 <CA+5PVA516=cSSZZTAZT9Zvx6J=AuOJutVN4Zd9hu4OEZEVuMoA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+5PVA516=cSSZZTAZT9Zvx6J=AuOJutVN4Zd9hu4OEZEVuMoA@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=NdDm13D4 c=1 sm=1 tr=0 ts=6859d835 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=NzN3x85bpFtRiAQTPCQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDE1NSBTYWx0ZWRfXz7AMPdIQ2yBy
 v7acvrLFup/3FetHozD44obT+6pcpnKGyRQK557juz9xKf+noAk043h/1uQYvKUHpS14+3txeSM
 MArZNmgTiIqOqBG+XmAFQ+s/jN1tEjuTFt/+ungj+CgsuNwrsJuqxaPV50rf3xuXCnP81JuCOYB
 /ES1XaIB3kRJJi7mMHehKZW2dsGJd75cdBILbaR749jksdpqwjzvbVUo2kGlrhntZGuWXOC+ksr
 cHXe71QIZl3FRANgOpYA9+zNSRIiSPOxckFa9xKfyNcJyHTD8AmGeFOmUa7TVlItKZU2AsSvYE/
 pcUbl3j+KTQTAVjvjeGORDZpXXKZR/3Kyvy0E3QQvcgVH5ZVBrrjcNjB0iYqWm0QW9tDhnotSOp
 szaWpryJ0KNF75OIYWx9du0AqAS+/FY/PpqKh7SsYWg2qSK4hegNwcekynzGyZ+9GvarRBWD
X-Proofpoint-ORIG-GUID: 6JRtCijYP09l7mApGTfku6w_OcafRpjJ
X-Proofpoint-GUID: 6JRtCijYP09l7mApGTfku6w_OcafRpjJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_07,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230155

On Mon, Jun 23, 2025 at 12:00:40PM -0400, Josh Boyer wrote:
> On Mon, Jun 23, 2025 at 9:55 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On 23/06/2025 16:50, Josh Boyer wrote:
> > > On Mon, Jun 23, 2025 at 9:42 AM Dmitry Baryshkov
> > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >>
> > >> On Mon, Jun 23, 2025 at 07:54:44PM +0800, Slark Xiao wrote:
> > >>> For MHI modems, it defines an edl firmware in kernel drivers/bus/
> > >>> mhi/host/pci_generic.c file. According to the requirement of MHI
> > >>> driver maintainer, we shall commit this firmware before commiting
> > >>> kernel driver support.
> > >>> Since different vendor use different firmwares, so we add a
> > >>> vendor sub-folder under qcom/sdx61.
> > >>>
> > >>> Signed-off-by: Slark Xiao <slark.xiao@gmail.com>
> > >>> ---
> > >>>   WHENCE                                    |   7 +++++++
> > >>>   qcom/sdx61/foxconn/prog_firehose_lite.elf | Bin 0 -> 663552 bytes
> > >>>   2 files changed, 7 insertions(+)
> > >>>   create mode 100644 qcom/sdx61/foxconn/prog_firehose_lite.elf
> > >>>
> > >>
> > >> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > >
> > > I'm sorry, but I have no indication the submitter has the authority to
> > > submit this firmware.  It's from a gmail address.  Is your Ack
> > > implying Qualcomm is agreeing to submit this firmware?
> >
> > No, I can not validate the submitter too. It's more about the filename
> > hierarchy. I'm sorry for the confusion.
> 
> Thank you for clarifying.
> 
> Slark, given we can't identify this was supposed to be released and
> licensed under the Qualcomm license from your email address alone, we
> can't merge this.  We have no idea what the provenance of this
> firmware is.
> 
> Can you work with someone in Qualcomm to acknowledge this came from
> them and it's licensed appropriately by sending the firmware or at
> least an Ack from a qualcomm email address?

I'd say, Qualcomm or Foxconn.

-- 
With best wishes
Dmitry
